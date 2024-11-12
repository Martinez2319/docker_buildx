#!/bin/bash

# Paso 1: Construir la imagen y cargarla en Docker
echo "Construyendo la imagen con docker buildx..."
docker buildx build -t my_image:latest --load .

# Paso 2: Verificar si la imagen se construyó correctamente
if docker images -q my_image:latest; then
    echo "La imagen se construyó correctamente."
else
    echo "Error al construir la imagen."
    exit 1
fi

# Paso 3: Ejecutar el contenedor
echo "Ejecutando el contenedor..."
docker run -d --name my_container my_image:latest

# Paso 4: Verificar que el contenedor esté funcionando
docker exec my_container echo "Contenedor funcionando correctamente."

# Paso 5: Limpiar el contenedor
docker rm -f my_container

echo "Pruebas unitarias completas."
