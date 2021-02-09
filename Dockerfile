FROM ubuntu:18.04
RUN apt-get -y update \
    && apt-get -y upgrade \
    && apt-get -y install sudo \
    $$ apt-get -y install vim \
    && apt-get -my apt-get install -my wget gnupg \
    && apt-get -y install unixodbc-dev \
    && apt-get install -y locales curl python3-distutils \
    && apt-get -y install mysql-client \
    && apt-get -y install git \
    && curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python3 get-pip.py \
    && pip install -U pip \
    && mkdir /code \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8
WORKDIR /code
ADD requirements.txt /code
RUN pip install -r requirements.txt