FROM arm32v7/ubuntu

RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN ls

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

RUN echo $PATH
RUN echo $GOPATH

# install glide
ENV GOPATH=/usr/local/go
# COPY install-glide.sh install-glide.sh

# RUN chmod +x install-glide.sh 
# RUN ./install-glide.sh

RUN apt-get update && apt-get install -y curl
RUN curl -s https://glide.sh/get | GOPATH=/usr/local/go sh

# ENV GOPATH=/root/go

# get the edgexfoundry source
RUN go get github.com/edgexfoundry/edgex-go

# WORKDIR ~/go/src/github.com/edgexfoundry/edgex-go

# RUN make prepare
# RUN make build
