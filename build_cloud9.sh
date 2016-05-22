#!/bin/sh
PROJECT_NAME=docker_example_1

docker build -f Dockerfile.cloud9 -t ${PROJECT_NAME}:latest .
