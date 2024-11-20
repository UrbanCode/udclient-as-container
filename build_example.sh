#!/bin/bash

echo "this is a showcase to build 8.1.0 version of container using alpine and temurin 11"

export DEPLOY_VERSION=8.1.0
export DOCKER_BUILDKIT=1
export JRETYPE=temurin-alpine-11
docker build -f Dockerfile.variations --build-arg 'TARGET='$JRETYPE -t udclient:$DEPLOY_VERSION-$JRETYPE .

export JRETYPE=temurin-11
docker build -f Dockerfile.variations --build-arg 'TARGET='$JRETYPE -t udclient:$DEPLOY_VERSION-$JRETYPE .
