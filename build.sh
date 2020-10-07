#!/bin/sh

docker-compose up -d --build db
sleep 10

docker-compose run tool
docker-compose run schemaspy

docker-compose down