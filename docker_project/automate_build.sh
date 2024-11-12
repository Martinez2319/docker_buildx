#!/bin/bash

# Paso 1: Construir la imagen Docker
echo "Iniciando construcción de la imagen Docker..."
docker buildx build --platform linux/amd64,linux/arm64 --tag my_image . | tee build_log.txt

# Paso 2: Verificar si la construcción fue exitosa
if [ $? -eq 0 ]; then
  echo "La imagen Docker se construyó correctamente."

  # Paso 3: Cargar la imagen en Docker (si es necesario)
  echo "Cargando la imagen Docker..."
  docker load -i my_image.tar
  
  # Paso 4: Subir la imagen a Docker Hub (opcional, si quieres compartirla)
  echo "Subiendo la imagen a Docker Hub..."
  docker tag my_image yourdockerhubusername/my_image:latest
  docker push yourdockerhubusername/my_image:latest

  # Paso 5: Ejecutar la imagen (si deseas probarla localmente)
  echo "Ejecutando la imagen Docker..."
  docker run -it my_image
else
  echo "Hubo un error al construir la imagen Docker."
fi
