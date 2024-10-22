from loguru import logger
from fastapi import APIRouter, HTTPException, status
from fastapi.param_functions import Depends
from api.dependencies.auth import with_authentication
from api.db.cruds.users import UserModelCrud
import api.web.api.users.schemas as users_schemas


router = APIRouter()

@router.post("/", dependencies=[Depends(with_authentication)], response_model=users_schemas.UserCreateResponse)
async def create_user(
     user_body: users_schemas.UserCreate,
     uid: str = Depends(with_authentication),
     user_db: UserModelCrud = Depends() 
):
     """
     ユーザーを作成します\n
     Headerに {"Authorization": "Bearer ${token}"} を含む必要があります\n
     tokenはFierBase Authenticationで発行されたものです
     """ 
     user_exist = await user_db.is_exist(uid)
     if user_exist:
          raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Already existing users",
            headers={"WWW-Authenticate": "Bearer"}
        )
     
     logger.info("create_user")
     user = await user_db.create_user(uid,user_body)
     
     return user

@router.delete("/")
async def delete_user(
     uid: str = Depends(with_authentication),
     user_db: UserModelCrud = Depends() 
):
     user_exist = await user_db.is_exist(uid)
     if not user_exist:
          raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Invisible users",
            headers={"WWW-Authenticate": "Bearer"}
        )
     logger.info(f"delete_user {uid}")
     await user_db.delete_user(uid)

     return {"message":f"delete {uid}"}