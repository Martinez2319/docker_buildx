# Usa una imagen oficial de Python como base
FROM python:3.9-slim

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia el archivo 'requirements.txt' al contenedor
# 'requirements.txt' debe contener las dependencias del proyecto
COPY requirements.txt .

# Instala las dependencias de Python dentro del contenedor
RUN pip install --no-cache-dir -r requirements.txt

# Copia todo el contenido del proyecto al contenedor
COPY . .

# Establece el comando por defecto para ejecutar la aplicación cuando el contenedor se inicie
CMD ["python", "app.py"]

# Expone el puerto 5000 (si tu aplicación usa otro puerto, cambia este número)
EXPOSE 5000
