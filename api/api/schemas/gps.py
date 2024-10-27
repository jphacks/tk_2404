from datetime import datetime

from pydantic import BaseModel, Field


class GpsBase(BaseModel):
    latitude: float = 0.0
    longitude: float = 0.0


class GpsRequestBody(GpsBase):
    music_url: str = Field(max_length=256)


class GpsInfo(GpsBase):
    uid: str = Field(max_length=128)
    created_at: datetime
    updated_at: datetime

    class Config:
        from_attributes = True
        from_attributes = True
        from_attributes = True
        from_attributes = True
