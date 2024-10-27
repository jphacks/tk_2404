from typing import Optional

import httpx
from fastapi import APIRouter, HTTPException, Request
from loguru import logger

from api.services.spotify import spotify
from api.settings import settings

router = APIRouter()


@router.get("/login")
async def spotify_login(request: Request):
    scope = "user-read-private user-read-email"

    async with httpx.AsyncClient() as client:
        result = await client.get(
            f"https://accounts.spotify.com/authorize?client_id={settings.spotify_client_id}&client_secret={settings.spotify_client_secret}&redirect_uri={str(request.url_for('spotify_callback'))}&grant_type={scope}",
            headers={"Content-Type": "application/x-www-form-urlencoded"},
        )

    return result.next_request


@router.get("/callback")
async def spotify_callback(
    request: Request, code: Optional[str] = None
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
        raise HTTPException(status_code=400, detail="Spotify login faild.")

    try:
        logger.info(request.url_for("spotify_callback"))
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
