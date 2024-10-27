from fastapi import APIRouter
from fastapi.param_functions import Depends

from api.db.dao.gps_dao import GpsDao
from api.db.models.user_model import UserModel
from api.dependencies.auth import with_authentication
from api.schemas.gps import GPSRequestBody

router = APIRouter()


@router.post("/")
async def set_gps(
    item: GPSRequestBody,
    user: UserModel = Depends(with_authentication),
    gps_dao: GpsDao = Depends(),
):
    """
    GPS位置情報と関連付けた音楽URLを保存します
    """
    data = await gps_dao.create(
        uid=str(user.uid),
        music_url=item.music_url,
        latitude=item.latitude,
        longitude=item.longitude,
    )

    return data
