from fastapi.routing import APIRouter

from api.web.api import dummy, echo, monitoring, rabbit

api_router = APIRouter()
api_router.include_router(monitoring.router)
api_router.include_router(echo.router, prefix="/echo", tags=["echo"])
api_router.include_router(dummy.router, prefix="/dummy", tags=["dummy"])
api_router.include_router(rabbit.router, prefix="/rabbit", tags=["rabbit"])
