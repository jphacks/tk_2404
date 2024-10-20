from sqlalchemy.orm import Mapped, mapped_column
from sqlalchemy.sql.sqltypes import String, Integer

class UserModel(Base):
    """model for users."""

    __tablename__ = 'users'

    id = mapped_column(Integer, primary_key=True)
    uid = mapped_column(String)