from fastapi import APIRouter, HTTPException, Response, status
from fastapi.param_functions import Depends
from fastapi.responses import JSONResponse
from api.db.dao.user_dao import UserDao
from api.db.models.user_model import UserModel
from api.dependencies.auth import with_authentication
from api.schemas.users import UserInfo, UserProfile

router = APIRouter()


@router.get("/me")
async def user_me(
    user: UserModel = Depends(with_authentication),
) -> UserInfo:
    """
    アクセスしたユーザのデータを返します。アクセスしたユーザがDBに登録されていなかった場合新しく作成します。
    """
    user_info = UserInfo.model_validate(user)

    return user_info


@router.put("/me", response_model=UserInfo)
async def update_user_info(user_info: UserInfo):
    """指定されたユーザーの指定された項目を更新する"""


@router.get("/{uid}", response_model=UserProfile)
async def get_user_profile(uid: str, user_dao: UserDao = Depends()) -> UserProfile:
    """
    自身以外のユーザプロフィール
    """
    user = await user_dao.get(uid)

    if user is None:
        raise HTTPException(status_code=404, detail="User not found.")

    return UserProfile.model_validate(user)


@router.delete("/{uid}")
async def delete_user(
    uid: str,
    user: UserModel = Depends(with_authentication),  # 認証されたユーザー情報を取得
    user_dao: UserDao = Depends(),
) -> Response:
    """
    指定されたuidのユーザを削除します。
    アクセスしたユーザは認証済みである必要があります。
    """
    if user.uid != uid:
        raise HTTPException(
            status_code=403, detail="You do not have permission to delete this user."
        )

    await user_dao.delete(uid)

    return JSONResponse(
        {"message": "User deleted successfully."},
        status_code=status.HTTP_204_NO_CONTENT,
    )
