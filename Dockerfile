# 使用輕量級的 Python 3.10
FROM python:3.10-slim

# 設定工作目錄
WORKDIR /app

# 設定環境變數：防止 Python 產生 pyc 檔案，並強制刷新輸出流到終端
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# 安裝依賴 (先複製這個是為了利用 Docker 的快取機制)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 複製專案所有內容
COPY . .

# 暴露 Flask 網頁版使用的埠號
EXPOSE 5000

# 預設啟動 Flask 網頁版
CMD ["python", "app.py"]