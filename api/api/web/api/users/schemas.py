from datetime import datetime
from typing import Optional
from pydantic import BaseModel, Field

class UserBase(BaseModel):
    pass

class UserCreate(UserBase):
    name:str = Field(max_length=16, example="江無田はる")
    age:int = Field(example=18)
    gender:int = Field(ge=0,lt=10, example=1)
    listen_genre_id:int = 0

class UserCreateResponse(UserCreate):
    id: int
    uid: str = Field(max_length=128)
    created_at: datetime
    updated_at: datetime

    class Config:
        orm_mode = True