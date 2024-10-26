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
        home_location:Optional[str] = None,
        bio:Optional[str] = None,
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
            home_location = home_location,
            bio = bio,
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


from typing import List, Optional
from datetime import datetime #created_atを呼び出すためのインポート
from api.api.db.models.user_model import UserModel


def get_users_sort(offset: int, limit: int, sort: str):


    query = query(UserModel)

    # ソート処理
    if sort == "newest":
        query = query.order_by(UserModel.created_at.desc())
    elif sort == "oldest":
        query = query.order_by(UserModel.created_at)
    elif sort == "name":
        query = query.order_by(UserModel.name)
    elif sort == "name-reverse":
        query = query.order_by(UserModel.name.desc())

    # ページネーション
    return query.offset(offset).limit(limit).all()#queryのソート処理をかえすallはソート処理によって処理されたデータすべてを入れるという意味







