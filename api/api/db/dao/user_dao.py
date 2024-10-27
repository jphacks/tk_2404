from typing import Optional

from fastapi import Depends
from sqlalchemy import select
from sqlalchemy.exc import NoResultFound
from sqlalchemy.ext.asyncio import AsyncSession

from api.db.dependencies import get_db_session
from api.db.models.user_model import UserModel


class UserDao:
    """Class for accessing users table."""

    def __init__(self, session: AsyncSession = Depends(get_db_session)):
        self.session = session

    async def create(
        self,
        uid: str,
        name: Optional[str] = None,
        age: Optional[int] = None,
        gender: Optional[int] = None,
        listen_genre_id: Optional[int] = None,
        home_location: Optional[str] = None,
        bio: Optional[str] = None,
        email: Optional[str] = None,
        email_verified: Optional[bool] = None,
    ) -> UserModel:
        """
        新規ユーザーを作成します

        :param uid: ユーザのuid
        :return: ユーザが作成された場合、UserModelを返します
        """
        user = UserModel(
            uid=uid,
            name=name,
            age=age,
            gender=gender,
            listen_genre_id=listen_genre_id,
            home_location=home_location,
            bio=bio,
            email=email,
            email_verified=email_verified,
        )

        self.session.add(user)

        await self.session.flush()

        return user

    async def get(self, uid: str) -> UserModel | None:
        """
        uidからユーザを取得します

        :param uid: ユーザのuid
        :return: ユーザがある場合はUserModelを返し、ユーザが存在しない場合はNoneを返します
        """

        user = await self.session.get(UserModel, uid)

        return user

    async def delete(self, uid: str) -> None:
        """
        ユーザの削除を行う

        """
        user = await self.session.get(UserModel, uid)
        if user is None:
            raise NoResultFound("User not found.")

        await self.session.delete(user)

    async def update(self, uid: str, **kwards) -> UserModel | None:
        """
        ユーザーの情報更新を行う
        """

        query = select(UserModel).filter(UserModel.uid == uid)
        rows = await self.session.execute(query)

        user = rows.scalars().one()
        for key, value in kwards.items():
            if value is not None:
                setattr(user, key, value)

        await self.session.flush()
        return user

    async def get_users_sort(self, offset: int, limit: int, sort: str):
        """
        ユーザーをソートして取得します

        :param offset: 取得開始位置
        :param limit: 取得件数
        :param sort: ソートの種類
        :return: ソートされたユーザーのリスト
        """
        query = select(UserModel)

        # ソート処理
        sort_options = {
            "newest": UserModel.created_at.desc(),
            "oldest": UserModel.created_at,
            "name": UserModel.name,
            "name-reverse": UserModel.name.desc(),
        }

        if sort in sort_options:
            query = query.order_by(sort_options[sort])

        # ページネーション
        result = await self.session.execute(query.offset(offset).limit(limit))
        return result.scalars().all()
