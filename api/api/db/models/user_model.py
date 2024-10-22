from sqlalchemy.orm import Mapped, mapped_column
from sqlalchemy.sql.sqltypes import String, Integer, DateTime
from api.db.base import Base

class UserModel(Base):
    """model for users."""

    __tablename__ = 'users'

    id:Mapped[Integer] = mapped_column(Integer, primary_key=True)
    uid:Mapped[String] = mapped_column(String(128), nullable=False)
    name:Mapped[String] = mapped_column(String(16), nullable=False)
    age:Mapped[Integer] = mapped_column(Integer, nullable=False)
    gender:Mapped[Integer] = mapped_column(Integer, nullable=False)
    listen_genre_id:Mapped[Integer] = mapped_column(Integer, nullable=False)
    created_at:Mapped[DateTime] = mapped_column(DateTime, nullable=False)
    updated_at:Mapped[DateTime] = mapped_column(DateTime, nullable=False)
