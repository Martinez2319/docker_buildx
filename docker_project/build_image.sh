#!/bin/bash

# Definir los nombres de las plataformas y la imagen
PLATFORMS="linux/amd64,linux/arm64"
IMAGE_TAG="my_image"

# Construir la imagen
echo "Iniciando la construcción de la imagen Docker para plataformas: $PLATFORMS..."
docker buildx build --platform $PLATFORMS --tag $IMAGE_TAG . | tee build_log.txt

# Mensaje de éxito
echo "Construcción de la imagen completada y almacenada como $IMAGE_TAG."

# Opcional: cargar la imagen en Docker (si es necesario)
# docker push $IMAGE_TAG
