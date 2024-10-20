import taskiq_fastapi
from taskiq import AsyncBroker, InMemoryBroker
from taskiq_aio_pika import AioPikaBroker

from api.settings import settings

broker: AsyncBroker = AioPikaBroker(
    str(settings.rabbit_url),
)

if settings.environment.lower() == "pytest":
    broker = InMemoryBroker()

taskiq_fastapi.init(
    broker,
    "api.web.application:get_app",
)
