FROM eclipse-temurin:25-jre-alpine as temurin-alpine-25
COPY udclient/lib/* /usr/local/bin/lib/
COPY udclient/udclient /usr/local/bin/
ENV JAVA_HOME=/opt/java/openjdk
ENTRYPOINT [ "udclient" ]