from fastapi.routing import APIRouter

from api.web.api import gps, spotify, users

api_router = APIRouter()
api_router.include_router(users.router, prefix="/users", tags=["users"])
api_router.include_router(spotify.router, prefix="/spotify", tags=["spotify"])
api_router.include_router(gps.router, prefix="/gps", tags=["gps"])
