from datetime import datetime
from typing import Optional
from pydantic import BaseModel, Field


class UserBase(BaseModel):
    pass


class UserCreate(UserBase):
    name: Optional[str] = Field(max_length=16, example="江無田はる")
    age: Optional[int] = Field(example=18)
    gender: Optional[int] = Field(ge=0, lt=10, example=1)
    listen_genre_id: Optional[int] = 0


class UserInfo(UserCreate):
    # id: int
    uid: str = Field(max_length=128)
    email: str = Field(example="example@exampl.com")
    emailVerified: bool
    # is_initialid: bool
    created_at: datetime
    updated_at: datetime

    class Config:
        from_attributes = True
