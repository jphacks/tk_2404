import firebase_admin
from fastapi import Depends, HTTPException, status
from fastapi.security import HTTPAuthorizationCredentials, HTTPBearer
from firebase_admin import auth, credentials
from loguru import logger

from api.db.dao.user_dao import UserDao
from api.db.models.user_model import UserModel

# Initialize Firebase Admin SDK
cred = credentials.Certificate("./firebase_admin_account_key.json")
firebase_admin.initialize_app(cred)


async def with_authentication(
    cred: HTTPAuthorizationCredentials = Depends(HTTPBearer(auto_error=False)),
    user_db: UserDao = Depends(),
) -> UserModel:
    if not cred:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Invalid authentication credentials",
            headers={"WWW-Authenticate": "Bearer"},
        )

    try:
        decoded_token = auth.verify_id_token(cred.credentials)
    except auth.InvalidIdTokenError:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Invalid ID token",
            headers={"WWW-Authenticate": "Bearer"},
        )
    except auth.ExpiredIdTokenError:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Expired ID token",
            headers={"WWW-Authenticate": "Bearer"},
        )
    except Exception:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Unable to verify ID token",
            headers={"WWW-Authenticate": "Bearer"},
        )

    uid = decoded_token["uid"]

    if not isinstance(uid, str):
        logger.critical("uid value's type isn't string.")
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Invalid user ID",
            headers={"WWW-Authenticate": "Bearer"},
        )

    firebase_user = auth.get_user(uid)._data
    logger.info("Successfully fetched user id:\n{0}".format(firebase_user["localId"]))

    user = await user_db.get(uid)

    if user is None:
        user = await user_db.create(
            uid=uid,
            email=firebase_user["email"],
            emailVerified=firebase_user["emailVerified"],
        )

    logger.info("uid : {0}".format(uid))

    return user
