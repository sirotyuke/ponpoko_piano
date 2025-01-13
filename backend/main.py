from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
import os

app = FastAPI(
    title="Ponpoko Piano API",
    description="ぽんぽこピアノ教室のバックエンドAPI",
    version="1.0.0",
    root_path="/api"
)

# 環境変数から許可するオリジンを取得
ALLOWED_ORIGINS = [
    "http://localhost:3000",
    "http://localhost",
    "https://sironeko-tech.com"
]

# CORSの設定
app.add_middleware(
    CORSMiddleware,
    allow_origins=ALLOWED_ORIGINS,
    allow_credentials=True,
    allow_methods=["GET", "POST", "PUT", "DELETE", "OPTIONS"],
    allow_headers=["Content-Type", "Authorization", "Accept"],
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
