FROM resin/raspberry-pi-golang:1.9-stretch AS builder
MAINTAINER Steve Osselton <steve@iotechsys.com>

RUN echo $GOPATH
ENV GOPATH=/go
ENV PATH=$GOPATH/bin:$PATH
# RUN apk add --update --no-cache go git build-base
RUN apt-get update && apt-get install -y git build-essential
RUN go get github.com/hashicorp/consul/api
RUN go get github.com/magiconair/properties
RUN go get gopkg.in/yaml.v2
RUN go get github.com/BurntSushi/toml
RUN go get github.com/fatih/structs

# Set the working directory

WORKDIR $GOPATH/src/github.com/edgexfoundry/core-config-seed-go

# Copy go source files
COPY . .

# Build
RUN apk update && apk add make
RUN make build

#

FROM resin/raspberry-pi-golang:1.9-stretch

LABEL license='SPDX-License-Identifier: Apache-2.0' \
      copyright='Copyright (c) 2017: Steve Osselton'

# Install consul and create data directory
RUN apt-get update && apt-get install consul gosu -y --no-install-recommends \
  && apt-get clean && rm -rf /var/lib/apt/lists/* && mkdir -p /consul/data \
  && addgroup consul && adduser --system --ingroup consul consul \
  && mkdir -p /consul/config && chown -R consul:consul /consul

# Expose the consul data directory as a volume since there's mutable state in there.
VOLUME /consul/data

# Server RPC is used for communication between Consul clients and servers for internal
# request forwarding.
EXPOSE 8300

# Serf LAN and WAN (WAN is used only by Consul servers) are used for gossip between
# Consul agents. LAN is within the datacenter and WAN is between just the Consul
# servers in all datacenters.
EXPOSE 8301 8301/udp 8302 8302/udp

# HTTP and DNS (both TCP and UDP) are the primary interfaces that applications
# use to interact with Consul.
EXPOSE 8500 8600 8600/udp

# Environment variables
ENV ARCH=arm32v7
ENV APP_DIR=/edgex/core-config-seed-go
ENV APP=core-config-seed-go
ENV WAIT_FOR_A_WHILE=5
ENV CONSUL_ARGS="-server -client=0.0.0.0 -bootstrap -ui"

# Set the working directory
WORKDIR $APP_DIR

# Copy files
COPY --from=builder /go/src/github.com/edgexfoundry/core-config-seed-go/$APP .
COPY ./launch-consul-config.sh .
COPY ./docker-entrypoint.sh .
COPY ./res ./res
COPY ./config ./config

CMD ["sh", "launch-consul-config.sh"]
