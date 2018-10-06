FROM arm32v7/ubuntu

# installing system dependencie and OS tools

RUN apt-get update \
	&& apt-get install -y openssh-server vim-tiny pkg-config \
	&& apt-get install -y build-essential git wget libzmq3-dev curl

# crterate swap file 
RUN touch /tmp/theswap \
	&& chmod 600 /tmp/theswap \
	&& dd if=/dev/zero of=/tmp/theswap bs=1M count=2048 \
	&& mkswap /tmp/theswap 
# todo: swapom isn't working because of permissions issue
#	swapon /tmp/theswap

# installing golang and setting $GOPATH
RUN wget https://dl.google.com/go/go1.10.1.linux-armv6l.tar.gz
RUN tar -C /usr/local -xvf go1.10.1.linux-armv6l.tar.gz

COPY add_go_env_variables_bashrc.sh add_go_env_variables_bashrc.sh

RUN chmod 777 add_go_env_variables_bashrc.sh && ./add_go_env_variables_bashrc.sh
RUN /bin/bash -c "source ~/.bashrc"

# install glide
ENV GOPTH=/usr/local/go
RUN curl -SL https://glide.sh/get | sh

ENV GOPTH=/root/go

# get the edgexfoundry source
RUN go get github.com/edgexfoundry/edgex-go

WORKDIR ~/go/src/github.com/edgexfoundry/edgex-go

RUN make prepare
RUN make build
