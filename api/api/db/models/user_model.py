from sqlalchemy.orm import Mapped, mapped_column
from sqlalchemy.sql.sqltypes import String, Integer, Boolean
from api.db.base import Base


class UserModel(Base):
    """model for users."""

    __tablename__ = 'users'

    # id:Mapped[Integer] = mapped_column(Integer, primary_key=True, autoincrement=True)
    uid: Mapped[String] = mapped_column(
        String(length=128), primary_key=True, unique=True, nullable=False)
    name: Mapped[String] = mapped_column(String(length=16), default=None, nullable=True)
    age: Mapped[Integer] = mapped_column(Integer, default=None, nullable=True)
    gender: Mapped[Integer] = mapped_column(Integer, default=None, nullable=True)
    listen_genre_id: Mapped[Integer] = mapped_column(Integer, default=None, nullable=True)
    email: Mapped[String] = mapped_column(String, unique=True, nullable=False)
    emailVerified: Mapped[Boolean] = mapped_column(Boolean, nullable=False)