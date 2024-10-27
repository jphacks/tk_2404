from typing import Optional, Self

from fastapi import Depends
from loguru import logger
from sqlalchemy import select, func, literal
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

    async def get_list(self, lat:float, lon:float):
        """
        近い順で返す
        """

        # Main query to calculate distances
        query = (
            select(
                GpsModel,
                func.round(
                    func.sqrt(
                        (
                            literal(6334834) / func.pow(func.sqrt(func.pow(
                                func.pow(1 - 0.006674 * func.sin(
                                    (GpsModel.latitude / 2 + lat / 2) * func.pi() / 180
                                ),2),3
                            ) * (GpsModel.latitude - lat) * func.pi() / 180
                        ), 2) +
                        func.pow(
                            literal(6377397) / func.sqrt(func.pow(
                                1 - 0.006674 * func.sin(
                                    (GpsModel.latitude / 2 + lat / 2) * func.pi() / 180
                                ), 2)
                            ) * func.cos(
                                (GpsModel.latitude / 2 + lat / 2) * func.pi() / 180
                            ) * (GpsModel.longitude - lon) * func.pi() / 180
                        ),2)
                    ), 6
                ).label('distance')
            )
            .select_from(GpsModel)
            .order_by('distance')
        )

        # Execute the query
        results = await self.session.execute(query.limit(100))

        return results.scalars().all()

