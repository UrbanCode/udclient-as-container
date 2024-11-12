FROM eclipse-temurin:11-jre-ubi9-minimal as temurin-jre-ubi9-minimal
COPY udclient/lib/* /usr/local/bin/
COPY udclient/udclient /usr/local/bin
COPY udcli /usr/local/bin/
ENTRYPOINT [ "udcli" ]