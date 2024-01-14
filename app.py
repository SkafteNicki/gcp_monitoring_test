from fastapi import FastAPI
from prometheus_fastapi_instrumentator import Instrumentator

app = FastAPI()
Instrumentator().instrument(app).expose(app)

@app.get("/")
def read_root():
    """Simple root endpoint."""
    return {"Hello": "World"}

@app.get("/items/{item_id}")
def read_item(item_id: int):
    """Simple function to get an item by id."""
    return {"item_id": item_id}
