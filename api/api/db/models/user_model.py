from sqlalchemy.orm import Mapped, mapped_column
from sqlalchemy.sql.sqltypes import String, Integer, DateTime
from api.db.base import Base

class UserModel(Base):
    """model for users."""

    __tablename__ = 'users'

    id = mapped_column(Integer, primary_key=True)
    uid = mapped_column(String(128), nullable=False)
    name = mapped_column(String(16), nullable=False)
    email = mapped_column(String(318), nullable=False)
    age = mapped_column(Integer)
    gender = mapped_column(Integer, nullable=False)
    listen_genre_id = mapped_column(Integer)
    created_at = mapped_column(DateTime, nullable=False)
    updated_at = mapped_column(DateTime, nullable=False)
