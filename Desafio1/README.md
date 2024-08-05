# Proyecto React App

Este documento proporciona las instrucciones para ejecutar y desplegar el proyecto tanto localmente como utilizando Docker.

## Ejecución local sin Docker

Para ejecutar el proyecto localmente sin utilizar Docker, sigue estos pasos:

1. Abre una terminal y navega a la carpeta del proyecto.
2. Ejecuta el siguiente comando para instalar las dependencias:
   ```bash
   npm install

3. Una vez finalizada la instalación de las dependencias, inicia la aplicación ejecutando:
   ```bash
   npm start

## Ejecución utilizando Docker

Para construir y ejecutar el proyecto utilizando Docker, sigue estos pasos:

1. Llena los datos requeridos en el archivo .env, incluyendo tu nombre de usuario y token de Docker Hub con los permisos adecuados para subir imágenes.

2. Para construir la imagen y subirla a Docker Hub, ejecuta:
   ```bash
    bash push.sh

3. Para descargar y ejecutar la imagen desde Docker Hub en tu entorno local, ejecuta:
   ```bash
    bash deploy.sh

## Herramientas necesarias

- Asegúrate de tener instaladas las siguientes herramientas para ejecutar el proyecto:

- Credenciales de Docker Hub: Necesarias para autenticarse y subir la imagen al repositorio.

- Git Bash: Recomendado para usuarios de Windows para ejecutar scripts de Bash.

- Docker Desktop para Windows o Docker para otros sistemas operativos: Esencial para manejar contenedores Docker.

## Información adicional

Si necesitas más información o asistencia, consulta la documentación oficial de las herramientas mencionadas.


Este `README.md` proporciona una guía básica para que los desarrolladores puedan comenzar rápidamente con la configuración y ejecución del proyecto.
