FROM ubuntu:20.04

MAINTAINER Raul R., <ricea.raul2002@gmail.com>

RUN apt update && \
    apt upgrade -y && \
    apt install -y libstdc++6 libreadline5 libncursesw5 tar curl iproute2 openssl lib32gcc1 libstdc++6 zlib1g wget && \
    useradd -d /home/container -m container && curl -o /usr/lib/libmysqlclient.so.16 https://nightly.mtasa.com/files/x64/libmysqlclient.so.16

USER container
ENV  USER container
ENV  HOME /home/container

WORKDIR /home/container

EXPOSE 1000-30000

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
