from datetime import datetime
from typing import Optional
from pydantic import BaseModel, Field


class UserBase(BaseModel):
    pass


class UserProfile(UserBase):
    """ユーザのプロフィール"""
    name: Optional[str] = Field(max_length=16, example="江無田はる")
    age: Optional[int] = Field(example=18)
    gender: Optional[int] = Field(ge=0, lt=10, example=1)
    listen_genre_id: Optional[int] = 0
    live_area: Optional[str] = Field(max_length=32, example="東京")
    profile_text: Optional[str] = Field(max_length=64, example="Hello World")


class UserInfo(UserProfile):
    """ユーザの登録情報"""
    uid: str = Field(max_length=128)
    email: str = Field(example="example@exampl.com")
    emailVerified: bool
    # TODO : 設定が完了しているか判別するパラメータをつける
    # is_initialid: bool
    created_at: datetime
    updated_at: datetime

    class Config:
        from_attributes = True
