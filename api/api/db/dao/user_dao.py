from typing import Optional
from loguru import logger

from fastapi import Depends
from sqlalchemy.ext.asyncio import AsyncSession

from api.db.dependencies import get_db_session
from api.db.models.user_model import UserModel

class UserDao:
    """Class for accessing users table."""

    def __init__(self, session: AsyncSession = Depends(get_db_session)):
        self.session = session

    async def create(
        self,
        uid:str,
        name:Optional[str] = None,
        age:Optional[int] = None,
        gender:Optional[int] = None,
        listen_genre_id:Optional[int] = None,
        live_area:Optional[str] = None,
        profile_text:Optional[str] = None,
        email:Optional[str] = None,
        emailVerified:Optional[bool] = None
    )->UserModel:
        """
        新規ユーザーを作成します

        :param uid: ユーザのuid
        :return: ユーザが作成された場合、UserModelを返します
        """
        user = UserModel(
            uid = uid,
            name = name,
            age = age,
            gender = gender,
            listen_genre_id = listen_genre_id,
            live_area = live_area,
            profile_text = profile_text,
            email = email,
            emailVerified = emailVerified
        )

        self.session.add(user)

        await self.session.flush()

        return user
    
    async def get(self, uid:str) -> UserModel | None:
        """
        uidからユーザを取得します

        :param uid: ユーザのuid
        :return: ユーザがある場合はUserModelを返し、ユーザが存在しない場合はNoneを返します
        """

        user = await self.session.get(UserModel, uid)
        
        return user
    
