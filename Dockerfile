# Imagen base ligera
FROM python:3.11-slim

# Evitar prompts interactivos
ENV DEBIAN_FRONTEND=noninteractive

# Dependencias del sistema (necesarias para pyodbc)
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    unixodbc \
    unixodbc-dev \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Directorio de trabajo
WORKDIR /app

# Instalar Poetry
RUN pip install --no-cache-dir poetry

# Desactivar virtualenv interno de Poetry (buena práctica en Docker)
RUN poetry config virtualenvs.create false

# Copiar SOLO pyproject.toml
COPY pyproject.toml /app/

# Instalar dependencias
RUN poetry install --no-root

# Exponer puerto de JupyterLab
EXPOSE 8888

# Comando de arranque
CMD ["poetry", "run", "jupyter-lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
