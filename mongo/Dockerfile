FROM resin/rpi-raspbian

RUN apt-get update && apt-get install -y scons libssl-dev python-pip libffi-dev libcurl4-openssl-dev cmake

COPY add_python_requirements.sh add_python_requirements.sh

RUN chmod 777 add_python_requirements.sh && ./add_python_requirements.sh

