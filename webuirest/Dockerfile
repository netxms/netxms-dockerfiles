# Dockerfile for building NetXMS webui

FROM registry.gitlab.com/matthew-beckett/netxms-dockerfiles/webui:3-8-314
MAINTAINER Matt Beckett <matt@beckett.cloud>

ENV MAJOR_VERSION=3.8 MINOR_VERSION=314 NETXMS_SERVER=127.0.0.1 NETXMS_SESSIONTIMEOUT=120 NETXMS_ENABLEADVANCEDSETTINGS=true

COPY webuirest/docker-entrypoint.sh /

RUN wget -O /usr/local/tomcat/webapps/nxapisrv.war http://www.netxms.org/download/releases/${MAJOR_VERSION}/netxms-websvc-${MAJOR_VERSION}.${MINOR_VERSION}.war && \
    sha256sum /usr/local/tomcat/webapps/nxapisrv.war && \
    chmod 755 /docker-entrypoint.sh
    
ENTRYPOINT [ "/docker-entrypoint.sh" ]
