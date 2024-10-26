from typing import Optional

from pytest import console_main
from api.db.dao.user_dao import UserDao
from api.db.models.user_model import UserModel
from loguru import logger
from fastapi import APIRouter, HTTPException, Request, Response
from fastapi.param_functions import Depends
from api.dependencies.auth import with_authentication
from api.services.spotify import spotify
from api.settings import settings


import api.web.api.users.schemas as users_schemas


router = APIRouter()

@router.get("/callback")
async def spotify_callback(
    request: Request,
    code: Optional[str] = None,
    user_dao: UserDao = Depends()
):
    """Process login response from Google.

    When a login or registration is successful,
    you will be automatically logged in via a URL with query parameters.

    :param request: Request object of fastAPI.
    :param code: String will be use to retrieve access token.
    :param user_dao: UserDAO Object
    :param token_dao: TokenDAO Object
    :raises NotVerifiedEmailError: If not verified email
    :returns:
        Redirect to login url or response
        BadRequest(400) when code is not valid.
    """
    if code is None:
        logger.error("Spotify login failed")
        raise HTTPException(
            status_code=400, detail="Spotify login faild."
        )

    try:
        access_token = await spotify.get_token(
            code=code,
            client_id=settings.spotify_client_id,
            client_secret=settings.spotify_client_secret,
            redirect_uri=str(request.url_for("spotify_callback")),
        )
        logger.info("Success to retrieve access token from Google API.")
    except spotify.FaildRetrieveAccessTokenError:
        logger.error("Failed to retrieve access token for Google login.")
        raise HTTPException(
            status_code=500,
            detail="Failed to retrieve the access token for Google login.",
        )

    user_info = await spotify.get_user_info(access_token)

    logger.info(f"spotify_user_info: {user_info}")
