# Dockerfile to build ProxPush client
# ProxPush is a proxy to allow Prometheus to scrape through NAT etc.
# This will contain the client program.

FROM golang:1.9-alpine3.6
MAINTAINER Anthony Rogliano <aroglian@cisco.com>
LABEL Description="ProxPush client docker image"

RUN apk update \
  && apk upgrade \
  && apk add --no-cache \
         git

WORKDIR /proxpush

RUN go get github.com/robustperception/pushprox/client \
  && apk del git \
  && cd /go/src/github.com/robustperception/pushprox/client \
  && go build

ENV PROXPUSH_URL http://localhost:8080

CMD exec /go/bin/client --proxy-url=${PROXPUSH_URL}
