FROM azul/zulu-openjdk-alpine:8u292-8.54.0.21

MAINTAINER Jaden.Li 

ENV GLIBC_VERSION=2.31-r0

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
 && apk update \
 && apk add --no-cache bash curl wget \
 && wget https://github.com.cnpmjs.org/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk \
 && apk add --no-cache --allow-untrusted glibc-${GLIBC_VERSION}.apk \
 && rm glibc-${GLIBC_VERSION}.apk

EXPOSE 22