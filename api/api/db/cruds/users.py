from datetime import datetime
from loguru import logger

from fastapi import Depends
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select, delete

from api.db.dependencies import get_db_session
from api.db.models.user_model import UserModel
import api.web.api.users.schemas as users_schema 

class UserModelCrud:
    """Class for User Model table."""

    def __init__(self, session: AsyncSession = Depends(get_db_session)):
        self.session = session
    
    async def create_user(self, uid:str, user_create:users_schema.UserCreate) -> users_schema.UserCreateResponse:
        dt_now = datetime.now()
        user = UserModel(uid=uid,created_at=dt_now,updated_at=dt_now,**user_create.model_dump())

        self.session.add(user)
        await self.session.commit()
        await self.session.refresh(user)

        # test
        logger.info(self.session.execute(select(UserModel).where(UserModel.uid == uid)))

        return user
    
    async def delete_user(self, uid:str)->None:
        stmt = delete(UserModel).where(UserModel.uid == uid)
        self.session.execute(stmt)
        await self.session.commit()
    
    async def is_exist(self, uid:str) -> bool:
        """
        uidを使用してユーザ情報の有無を判断します

        :param uid: str
        :return: bool
        """
        stmt = select(UserModel).where(UserModel.uid == uid)
        user_data = self.session.execute(stmt)

        return user_data is None