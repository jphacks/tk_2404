from api.db.models.user_model import UserModel
from loguru import logger
from fastapi import APIRouter, Response
from fastapi.param_functions import Depends
from api.dependencies.auth import with_authentication

import api.web.api.users.schemas as users_schemas


router = APIRouter()


@router.get("/me", response_model=users_schemas.UserInfo)
async def user_me(
    user: UserModel = Depends(with_authentication),
) -> Response:
    """
    アクセスしたユーザのデータを返します。アクセスしたユーザがDBに登録されていなかった場合新しく作成します。
    """
    return user
