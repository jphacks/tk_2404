from typing import Optional
from loguru import logger

from fastapi import Depends
from sqlalchemy.ext.asyncio import AsyncSession

from api.db.dependencies import get_db_session
from api.db.models.gps_model import GpsModel

from sqlalchemy.exc import NoResultFound


class GpsDao:
    """Class for accessing gps table."""

    def __init__(self, session: AsyncSession = Depends(get_db_session)):
        self.session = session

    # TODO: ここをつくる
    async def create(
        self,
        uid: str,
    ) -> GpsModel:
        """
        GPS座標に音楽URLを添付したデータを作成します

        :param uid: ユーザのuid
        :return: ユーザが作成された場合、UserModelを返します
        """
        data = GpsModel(
            uid=uid,
        )

        self.session.add(data)

        await self.session.flush()

        return data
