import urllib
from typing import Dict, List, Optional
from venv import logger

import httpx

from api.settings import settings

class FaildRetrieveAccessTokenError(Exception):
    """Raised when failed to retrieve access token."""

async def get_token(
    code: str,
    client_id: Optional[str],
    client_secret: Optional[str],
    redirect_uri: str,
    grant_type: str = "authorization_code",
) -> str:
    """Function to get access token from Spotify API.

    This function is to get access token from Google API and return it.

    :param code: String will use to get access token.
    :param client_id: The client_id of the Google APP.
    :param client_secret: The client_secret of the Google APP.
    :param redirect_uri: The redirect uri.
    :param grant_type: The grant type.
    :returns: The access token
    :raises FaildRetrieveAccessTokenError: if can't retrieve access token
    """
    params = {
        "code": code,
        "client_id": client_id,
        "client_secret": client_secret,
        "redirect_uri": redirect_uri,
        "grant_type": grant_type,
    }
    async with httpx.AsyncClient() as client:
        response = await client.post(settings.spotify_token_url, data=params,headers={'Content-Type':'application/x-www-form-urlencoded'})
        token_data = response.json()
    if "access_token" not in token_data:
        logger.info(f"token_data:{token_data}")
        raise FaildRetrieveAccessTokenError()

    return token_data["access_token"]


async def get_user_info(access_token: str) -> Dict[str, str]:
    """Get user info from Spotify API using access_token.

    This function returns user information

    :param access_token: The access token of google
    :returns: Returns the userinfo in dictionary.
    """
    headers = {"Authorization": f"Bearer {access_token}"}

    async with httpx.AsyncClient() as client:
        response = await client.get(settings.spotify_profile_url, headers=headers)
        user_info = response.json()

    return user_info


