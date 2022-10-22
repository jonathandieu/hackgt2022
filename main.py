from fastapi import FastAPI

app = FastAPI()


@app.get("/")
async def root():
    return {"massage": "Hello John you stinky bum >:)"}
