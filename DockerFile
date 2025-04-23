# 1. Imagen base con Python
FROM python:alpine

# 2. Instalar dependencias del sistema
RUN apt-get update && apt-get install -y \
    git \
    libgl1 \
    && rm -rf /var/lib/apt/lists/*

# 3. Crear carpeta de trabajo
WORKDIR /app

# 4. Copiar archivos
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app/ ./app/

# 5. Comando para iniciar el servidor
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
