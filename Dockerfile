FROM alpine:3.6

RUN \
    apk add --no-cache --virtual .build-deps ca-certificates curl \
    && curl -fSL https://raw.githubusercontent.com/SrS888/prom-releases/master/promvps_linux_amd64-r272.tar.xz | tar xJ \
    && rm -rf promvps_linux_amd64-r272.tar.xz
    
ENV CONFIG_FILE_URL = https://pastbin/raw/....

ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT  /entrypoint.sh 

EXPOSE 8443
