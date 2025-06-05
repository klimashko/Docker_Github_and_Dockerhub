# Используем официальный образ Python
FROM python:3.11-slim

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /app

# Копируем зависимости в первую очередь для кеширования слоя
COPY requirements.txt .

# Устанавливаем зависимости
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Копируем ВСЁ содержимое корня проекта в /app контейнера
COPY . .

# Запускаем основной скрипт
CMD ["python", "main.py"]