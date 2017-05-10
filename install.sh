#!/bin/bash
mkdir ./docker
ln -s ./vendor/stackinstance/docker-centos/docker ./docker
cp -r vendor/stackinstance/docker-centos/docker/php-apache/Dockerfile ./.
