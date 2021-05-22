# Dockerfile for building NetXMS server image

FROM debian:buster-slim
MAINTAINER Matt Beckett <matt@beckett.cloud>
ENV MAJOR_VERSION=3.8 MINOR_VERSION=314

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
    apt-get update && apt-get -y install curl apt-transport-https gnupg && \
    curl -sL http://packages.netxms.org/netxms.gpg | apt-key add - && \
    echo "deb http://packages.netxms.org/debian/ buster main" > /etc/apt/sources.list.d/netxms.list && \
    apt-get update && apt-get -y install netxms-server="${MAJOR_VERSION}.${MINOR_VERSION}-1" netxms-agent="${MAJOR_VERSION}.${MINOR_VERSION}-1" netxms-dbdrv-sqlite3="${MAJOR_VERSION}.${MINOR_VERSION}-1" supervisor && apt-get clean

ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US \
    LC_ALL=en_US.UTF-8 \
    NETXMSD_UNLOCK_ON_STARTUP=1 \
    NETXMSD_UPGRADE_ON_STARTUP=1 \
    NETXMSD_DEBUG_LEVEL=0

VOLUME /data

EXPOSE 4701
EXPOSE 514/udp

COPY ./docker-entrypoint.sh ./wait-for /

COPY server/docker-entrypoint.sh server/nxagent.sh /

CMD ["/docker-entrypoint.sh"]
