#!/bin/bash
apt-get install openssh-server vim-tiny pkg-config
apt-get install build-essential git wget libzmq3-dev
apt-get install curl
curl https://glide.sh/get | GOPATH=/usr/local/go sh