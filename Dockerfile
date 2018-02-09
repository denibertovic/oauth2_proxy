FROM alpine:3.7

ENV OAUTH2_PROXY_VERSION=2.2
ENV OAUTH2_PROXY_VERSION_LONG=$OAUTH2_PROXY_VERSION.0

RUN apk add --no-cache ca-certificates
RUN apk add --no-cache --virtual .fetch-deps \
    openssl \
    tar \
  && wget -O /oauth2_proxy.tar.gz https://github.com/bitly/oauth2_proxy/releases/download/v${OAUTH2_PROXY_VERSION}/oauth2_proxy-${OAUTH2_PROXY_VERSION_LONG}.linux-amd64.go1.8.1.tar.gz \
  && tar -xvzf /oauth2_proxy.tar.gz --strip-components=1 \
  && rm /oauth2_proxy.tar.gz \
  && apk del .fetch-deps

EXPOSE 4180
ENTRYPOINT ["/oauth2_proxy"]

