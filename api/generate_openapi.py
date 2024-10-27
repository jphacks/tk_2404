import os
import sys

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

import json

from fastapi import FastAPI

try:
    from api.web.application import get_app
except ImportError:
    raise ImportError("Ensure that the 'api.web.application' module and 'get_app' function are correctly defined and accessible.")

def generate_openapi_json(app: FastAPI, output_file: str):
    openapi_schema = app.openapi()
    with open(output_file, "w") as f:
        json.dump(openapi_schema, f, indent=2)

if __name__ == "__main__":
    app = get_app()
    generate_openapi_json(app, "../openapi.json")

