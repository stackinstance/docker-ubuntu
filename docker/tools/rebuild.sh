#!/bin/bash

docker-compose --project-name project down
docker rmi project_php-apache
docker-compose --project-name project build --no-cache
docker-compose --project-name project up
