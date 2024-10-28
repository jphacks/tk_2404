import decimal
from urllib import response
from fastapi import APIRouter
from fastapi.param_functions import Depends
import math

from api.db.dao import gps_dao
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

@router.get("/")
async def get_list(
    lat:float,
    lon:float,
    gps_dao: GpsDao = Depends()
):
    data = await gps_dao.get_list()
    for i in range(len(data)):
        data[i]["distance"] = calculate_distance(decimal.Decimal(lat),data[i].latitude, decimal.Decimal(lon),data[i].longitude)

    data = sorted(data, key=lambda x:x["distance"])


    return data

from decimal import Decimal, getcontext
import math

# 小数点の精度設定
getcontext().prec = 28

def calculate_distance(lat_1, lat_2, lon_1, lon_2):
    # 定数をDecimal型で定義
    a = Decimal('6334834')
    b = Decimal('6377397')
    e2 = Decimal('0.006674')
    pi = Decimal(math.pi)

    # Decimal型の緯度・経度
    lat_1 = Decimal(lat_1)
    lat_2 = Decimal(lat_2)
    lon_1 = Decimal(lon_1)
    lon_2 = Decimal(lon_2)

    # 中間の緯度 (ラジアンに変換)
    lat_mid = (lat_1 + lat_2) / Decimal(2) * pi / Decimal(180)

    # 2つの項を計算
    term1 = (a / Decimal(math.sqrt((1 - e2 * Decimal(math.sin(float(lat_mid))) ** 2) ** 3))
             * (lat_1 - lat_2) * pi / Decimal(180)) ** 2
    term2 = (b / Decimal(math.sqrt(1 - e2 * Decimal(math.sin(float(lat_mid))) ** 2))
             * Decimal(math.cos(float(lat_mid))) * (lon_1 - lon_2) * pi / Decimal(180)) ** 2

    # 距離の計算
    distance = Decimal(math.sqrt(float(term1 + term2)))

    return distance

