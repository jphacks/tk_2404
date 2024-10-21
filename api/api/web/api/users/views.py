from fastapi import APIRouter
from fastapi.param_functions import Depends
from api.dependencies.auth import with_authentication
import api.web.api.users.schemas as users_schemas


router = APIRouter()

@router.post("/")
async def create_user(
    user_body: users_schemas.UserCreate
):
     """
     ユーザーを作成します
     """
     return {"message": "users"}