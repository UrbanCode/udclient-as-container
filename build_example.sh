#!/bin/bash

echo "this is a showcase to build 8.1.0 version of container using alpine and temurin 11"

export DEPLOY_VERSION=8.1.2.3
export DOCKER_BUILDKIT=1
export JRETYPE=temurin-alpine-11
docker build -f Dockerfile.variations --build-arg 'TARGET='$JRETYPE -t udclient:$DEPLOY_VERSION-$JRETYPE .
docker tag udclient:$DEPLOY_VERSION-$JRETYPE ghcr.io/urbancode/udclient:$DEPLOY_VERSION-$JRETYPE
docker push ghcr.io/urbancode/udclient:$DEPLOY_VERSION-$JRETYPE


export JRETYPE=temurin-11
docker build -f Dockerfile.variations --build-arg 'TARGET='$JRETYPE -t udclient:$DEPLOY_VERSION-$JRETYPE .
docker tag udclient:$DEPLOY_VERSION-$JRETYPE ghcr.io/urbancode/udclient:$DEPLOY_VERSION-$JRETYPE
docker push ghcr.io/urbancode/udclient:$DEPLOY_VERSION-$JRETYPE

export JRETYPE=adoptjdk-alpine-jre
docker build -f Dockerfile.variations --build-arg 'TARGET='$JRETYPE -t udclient:$DEPLOY_VERSION-$JRETYPE .
docker tag udclient:$DEPLOY_VERSION-$JRETYPE ghcr.io/urbancode/udclient:$DEPLOY_VERSION-$JRETYPE
docker push ghcr.io/urbancode/udclient:$DEPLOY_VERSION-$JRETYPE
