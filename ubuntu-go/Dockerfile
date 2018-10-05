FROM arm32v7/ubuntu

# installing system dependencie and OS tools
RUN apt-get update && apt install build-essential git wget libzmq3-dev \
	&& apt-get install openssh-server vim-tiny pkg-config

# crterate swap file 
RUN touch /tmp/theswap \
	&& chmod 600 /tmp/theswap \
	&& dd if=/dev/zero of=/tmp/theswap bs=1M count=2048 \
	&& mkswap /tmp/theswap \
	&& swapon /tmp/theswap

# installing golang and setting $GOPATH
RUN wget https://dl.google.com/go/go1.10.1.linux-armv6l.tar.gz \
	&& tar -C /usr/local -xvf go1.10.1.linux-armv6l.tar.gz \

COPY add_go_env_variables_bashrc.sh add_go_env_variables_bashrc.sh

RUN chmod 777 add_go_env_variables_bashrc.sh && ./add_go_env_variables_bashrc.sh
RUN source ~/.bashrc

# install glide
RUN apt-get install curl \
	&& curl https://glide.sh/get | GOPATH=/usr/local/go sh


# get the edgexfoundry source
RUN go get github.com/edgexfoundry/edgex-go

WORKDIR ~/go/src/github.com/edgexfoundry/edgex-go

RUN make prepare
RUN make build

CMD 

