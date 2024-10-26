from api.db.dao.user_dao import UserDao
from api.db.models.user_model import UserModel
from loguru import logger
from fastapi import APIRouter, HTTPException, Response
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



@router.delete("/{uid}")
async def delete_user(
    uid: str,
    user: UserModel = Depends(with_authentication),  # 認証されたユーザー情報を取得
    user_dao: UserDao = Depends()
) -> dict:
    """
    指定されたuidのユーザを削除します。
    アクセスしたユーザは認証済みである必要があります。
    """
    if user.uid != uid:
        raise HTTPException(status_code=403, detail="You do not have permission to delete this user.")

    await user_dao.delete(uid)
    return {"message": "User deleted successfully."}



@router.get("/users/{uid}", response_model=users_schemas.UserProfile)
async def get_user_profile(uid: str, user_dao: UserDao = Depends()) -> UserModel | None:
    """
    自身以外のユーザプロフィール
    """
    return await user_dao.get(uid=uid)


