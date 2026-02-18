from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from config import settings

# 創建 FastAPI 應用
app = FastAPI(
    title="Gymate - 健身管理系統",
    description="一個現代化的健身管理平台，幫助健身房、健身教練和健身愛好者高效管理健身相關事務。",
    version="1.0.0",
    docs_url="/docs",
    redoc_url="/redoc"
)

# 配置 CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=settings.ALLOWED_HOSTS,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
async def root():
    """根路徑 - 應用狀態檢查"""
    return {
        "message": "Welcome to Gymate API",
        "version": "1.0.0",
        "status": "running"
    }

@app.get("/health")
async def health_check():
    """健康檢查端點"""
    return {"status": "healthy", "message": "Gymate API is running"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(
        "main:app",
        host="0.0.0.0",
        port=8000,
        reload=True,
        log_level="info"
    )