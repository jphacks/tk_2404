from fastapi.security import HTTPBearer, HTTPAuthorizationCredentials
from fastapi import Depends, HTTPException, status
from firebase_admin import auth, credentials
from loguru import logger
import firebase_admin

# Initialize Firebase Admin SDK
cred = credentials.Certificate('./firebase_admin_account_key.json')
firebase_admin.initialize_app(cred)


def with_authentication(
    cred: HTTPAuthorizationCredentials = Depends(HTTPBearer(auto_error=False))
):
    if not cred:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Invalid authentication credentials",
            headers={"WWW-Authenticate": "Bearer"}
        )

    try:
        decoded_token = auth.verify_id_token(cred.credentials)
    except auth.InvalidIdTokenError:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Invalid ID token",
            headers={"WWW-Authenticate": "Bearer"}
        )
    except auth.ExpiredIdTokenError:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Expired ID token",
            headers={"WWW-Authenticate": "Bearer"}
        )
    except Exception:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Unable to verify ID token",
            headers={"WWW-Authenticate": "Bearer"}
        )

    uid = decoded_token['uid']

    if not isinstance(uid, str):
        logger.critical("uid value's type isn't string.")
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Invalid user ID",
            headers={"WWW-Authenticate": "Bearer"}
        )

    user = auth.get_user(uid)
    logger.info('Successfully fetched user data:\n{0}'.format(user._data))

    return uid