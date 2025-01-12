from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI(
    title="Ponpoko Piano API",
    description="ぽんぽこピアノ教室のバックエンドAPI",
    version="1.0.0",
    root_path="/api"
)

# CORSの設定
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
async def root():
    return {"message": "こんばんわに"}

@app.get("/health")
async def health_check():
    return {"status": "healthy"}

@app.get("/test")
async def test():
    return {
        "message": "This is a test endpoint",
        "status": "success"
    }
