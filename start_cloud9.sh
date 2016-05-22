#!/bin/sh
PROJECT_NAME=docker_example_1

docker run -ti -d -p 80:80 $PROJECT_NAME:latest
