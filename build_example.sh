#!/bin/bash

echo ""

export DOCKER_BUILDKIT=1
DEPLOY_VERSION=8.2.0
JRETYPE=temurin-alpine
JREVERSION=25

while getopts "d:t:v:h" opt; do
    case $opt in
        d) DEPLOY_VERSION="$OPTARG" ;;
        t) JRETYPE="$OPTARG" ;;
        v) JREVERSION="$OPTARG" ;;
        h) echo "building and pushing udclient container images to ghcr.io."
           echo "Input Parameter:"
           echo "    Deploy Version (default is 8.2.0): -d <version>" 
           echo "    JRE Type (default is temurin-alpine): -t <jre type>"
           echo "        other types supported are: semeru, temurin, temurin-alpine, temurin-ubi10-minimal"
           echo "        more variants can be added in Dockerfile.variations"
           echo "    JRE Version (default is 25): -v <jre version>"
           echo "        supported JRE vresions: 17, 21 and 25"
           ;;
        \?) echo "invalid option: -$OPTARG" ;;
        :) echo "Option -$OPTARG reguires a value." ;;
    esac
done

echo "Building udclient container image for Deploy Version $DEPLOY_VERSION with JRE Type $JRETYPE and JRE Version $JREVERSION" 
docker build -f Dockerfile.variations --build-arg 'PROVIDER='$JRETYPE --build-arg 'VERSION='$JREVERSION -t udclient:$DEPLOY_VERSION-$JRETYPE-$JREVERSION .
docker tag udclient:$DEPLOY_VERSION-$JRETYPE-$JREVERSION ghcr.io/urbancode/udclient:$DEPLOY_VERSION-$JRETYPE-$JREVERSION
docker push ghcr.io/urbancode/udclient:$DEPLOY_VERSION-$JRETYPE-$JREVERSION

