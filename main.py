from fastapi import FastAPI

app = FastAPI()


@app.get("/")
async def root():
    return {"massage": "Hello John you stinky bum >:)"}

@app.get("/users/me")
async def read_user_me():
    return {"user_id": "the current user"}

@app.get("/cards/chase/freedomflex")
async def get_chase():
    return {
        "card": "Freedom Flex",
        "category": "Paypal and Walmart"
    }

@app.get("/cards/discover/discoverit")
async def get_discover():
    return {
        "card": "Discover It",
        "category": "Amazon.com and Digital Wallets"
    }
    
@app.get("/cards/citi/dividend")
async def get_citi():
    return {
        "card": "Citi Dividend",
        "category": "Restaurants and Select Travel"
    }