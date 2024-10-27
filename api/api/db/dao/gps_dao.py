from typing import Optional

from fastapi import Depends
from loguru import logger
from sqlalchemy.ext.asyncio import AsyncSession

from api.db.dependencies import get_db_session
from api.db.models.gps_model import GpsModel


class GpsDao:
    """Class for accessing gps table."""

    def __init__(self, session: AsyncSession = Depends(get_db_session)):
        self.session = session

    # TODO: ここをつくる
    async def create(
        self, uid: str, music_url: str, latitude: float, longitude: float
    ) -> GpsModel:
        """
        GPS座標に音楽URLを添付したデータを作成します

        :param uid: ユーザのuid
        :param music_url: 共有する音楽情報のURL
        :param latitude: GPSで取得した緯度
        :param longitude: GPSで取得した経度
        :return: ユーザが作成された場合、GpsModelを返します
        """
        data = GpsModel(
            uid=uid, music_url=music_url, latitude=latitude, longitude=longitude
        )

        self.session.add(data)

        await self.session.flush()

        return data
