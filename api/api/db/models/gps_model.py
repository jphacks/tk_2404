from sqlalchemy.orm import Mapped, mapped_column
from sqlalchemy.sql.sqltypes import Numeric, Integer, String

from api.db.base import Base


class GpsModel(Base):
    """model for gps_musics."""

    __tablename__ = "gps_musics"

    gps_id: Mapped[Integer] = mapped_column(
        Integer, primary_key=True, autoincrement=True
    )
    uid: Mapped[String] = mapped_column(String(length=128), nullable=False)
    music_url: Mapped[String] = mapped_column(String(length=256), nullable=False)
    latitude: Mapped[Numeric] = mapped_column(Numeric(10,6), nullable=False)
    longitude: Mapped[Numeric] = mapped_column(
        Numeric(10,6), nullable=False
    )
