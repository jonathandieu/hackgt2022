from fastapi import FastAPI

app = FastAPI()


@app.get("/")
async def root():
    return {"massage": "Hello John you stinky bum >:)"}

@app.get("/users/me")
async def read_user_me():
    return {"user_id": "the current user"}
@app.get("/cards/chase")
async def read_user_me():
    return {
        "credit_card": "the current credit card",
        "bonus amount": 69
    }