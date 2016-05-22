#!/bin/sh

VERSION=1.0

# Configuracion general
PROJECT_NAME=docker_example_1
PROJECT_TAG=latest
DOCKERFILE=Dockerfile.cloud9

# Configuracion Docker Cloud9
HOST_PORT=80
CONT_PORT=80

case "$1" in

	"build")
	# Creacion de Docker Cloud9
	echo "Creando imagen Docker para Cloud9..."
	docker build -f ${DOCKERFILE} -t ${PROJECT_NAME}:${PROJECT_TAG} .
	;;
	
	"rm")
	# Borrado de Docker Cloud9
	echo "Borrando imagen Docker para Cloud9..."
	docker rmi ${PROJECT_NAME}:${PROJECT_TAG}
	;;

	"run")
	# Ejecicion de Docker Cloud9
	echo "Lanzando Cloud9 en el puerto ${HOST_PORT}..."
	docker run -ti -d -p ${HOST_PORT}:${CONT_PORT} --name ${PROJECT_NAME}_run ${PROJECT_NAME}:${PROJECT_TAG}
	;;

	"stop")
	# Parada de Docker Cloud 9
	echo "Parando Cloud9..."
	docker stop ${PROJECT_NAME}_run && docker rm ${PROJECT_NAME}_run
	;;

	*)
	echo "Script de lanzamiento de entorno de desarrollo Cloud9"
	echo "-----------------------------------------------------"
	echo "Version : ${VERSION}"
	echo
	echo "Gestion de imagenes"
	echo " $0 build - Crea la imagen Docker de Cloud9 para el proyecto ${PROJECT_NAME}"
	echo " $0 rm    - Borra la imagen Docker de Cloud9 para el proyecto {PROJECT_NAME}"
	echo 
	echo "Gestion de contenedores"
	echo " $0 run   - Ejecuta el entorno Cloud9 del proyecto ${PROJECT_NAME}"
	echo " $0 stop  - Para y borra el contenedor Cloud9 del proyecto ${PROJECT_NAME}"
	echo
	;;
esac
