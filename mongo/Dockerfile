FROM raspbian/stretch

RUN apt-get install -y scons libssl-dev python-pip libffi-dev libcurl4-openssl-dev cmake
RUN pip install -r ./buildscripts/requirements.txt 

COPY add_python_requirements.sh add_python_requirements.sh

RUN chmod 777 add_python_requirements.sh && ./add_python_requirements.sh

