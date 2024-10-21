from fastapi.param_functions import Depends
from api.dependencies.auth import with_authentication
from pydantic import BaseModel, Field

class UserBase(BaseModel):
    uid: str = Depends(with_authentication)

class UserCreate(UserBase):
    name:str = Field(max_length=16, example="江無田はる")
    email:str = Field(max_length=16, example="example@example.com")
    age:int
    gender:int = Field(ge=0,lt=10)
    listen_genre_id:int = 0

class UserCreateResponse(UserCreate):
    id: int
    created_at: str
    updated_at: str

    class Config:
        orm_mode = True