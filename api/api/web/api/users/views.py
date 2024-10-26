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

@router.put("/users/{uid}", response_model=UserModel)
async def update_user_info(
    user: UserModel,
    uid_: str,
    user_dao: UserDao = Depends(),
    name_ = None,
    age_ = None,
    gender_ = None,
    listen_genre_id_ = None,
    home_location_ = None,
    bio_ = None,
    email_ = None,
    emailVerified_ = None
):
    """指定されたユーザーの指定された項目を更新する"""
    if not (target_user := await user_dao.get(uid_)):
        raise HTTPException(status_code=403, detail="User not found")

    updated_user = await user_dao.update(
        uid_,
        # **user.model_dump()
        name = name_,
        age = age_,
        gender = gender_,
        listen_genre_id = listen_genre_id_,
        home_location = home_location_,
        bio = bio_,
        email = email_,
        emailVerified = emailVerified_
        )
    return updated_user
