FROM python:3.11-slim

# Install system dependencies for OpenCV and ddddocr
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY bot.py .

# The bot uses port 8099 for health checks
EXPOSE 8099

CMD ["python", "bot.py"]
