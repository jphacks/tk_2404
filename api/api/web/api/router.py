from fastapi.routing import APIRouter

from api.web.api import gps, monitoring, users

api_router = APIRouter()
api_router.include_router(monitoring.router)
api_router.include_router(users.router, prefix="/users", tags=["users"])
api_router.include_router(gps.router, prefix="/gps", tags=["gps"])
