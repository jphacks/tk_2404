from datetime import datetime
from typing import Optional

from pydantic import BaseModel, Field


class UserBase(BaseModel):
    pass


class UserProfile(UserBase):
    """ユーザのプロフィール"""

    name: Optional[str] = Field(max_length=16, examples=["江無田はる"])
    age: Optional[int] = Field(examples=[18])
    gender: Optional[int] = Field(ge=0, lt=10, examples=[1])
    listen_genre_id: Optional[int] = 0
    home_location: Optional[str] = Field(max_length=32, examples=["東京"])
    bio: Optional[str] = Field(max_length=64, examples=["Hello World"])


class UserInfo(UserProfile):
    """ユーザの登録情報"""

    uid: str = Field(max_length=128)
    email: str = Field(examples=["example@exampl.com"])
    emailVerified: bool
    # TODO : 設定が完了しているか判別するパラメータをつける
    # is_initialid: bool
    created_at: datetime
    updated_at: datetime

    class Config:
        from_attributes = True
