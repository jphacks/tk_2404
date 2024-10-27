from sqlalchemy.orm import Mapped, mapped_column
from sqlalchemy.sql.sqltypes import DOUBLE_PRECISION, Integer, String

from api.db.base import Base


class GpsModel(Base):
    """model for gps_musics."""

    __tablename__ = "gps_musics"

    gps_id: Mapped[Integer] = mapped_column(
        Integer, primary_key=True, autoincrement=True
    )
    uid: Mapped[String] = mapped_column(String(length=128), unique=True, nullable=False)
    music_url: Mapped[String] = mapped_column(String(length=256), nullable=False)
    latitude: Mapped[DOUBLE_PRECISION] = mapped_column(DOUBLE_PRECISION, nullable=False)
    longitude: Mapped[DOUBLE_PRECISION] = mapped_column(
        DOUBLE_PRECISION, nullable=False
    )
