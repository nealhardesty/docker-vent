FROM ubuntu:12.04
MAINTAINER nealhardesty@yahoo.com

RUN apt-get install -y curl libc6-i386

RUN curl -s "http://iweb.dl.sourceforge.net/project/ventrilovoip/ventrilo_srv-3.0.3-Linux-i386.tar.gz" -o /tmp/vent.tgz
RUN tar xzvf /tmp/vent.tgz -C /opt
RUN rm /tmp/vent.tgz

WORKDIR /opt/ventsrv

COPY ventrilo_srv.ini /opt/ventsrv/ventrilo_srv.ini

EXPOSE 3784/tcp 3784/udp

CMD /opt/ventsrv/ventrilo_srv -f/opt/ventsrv/ventrilo_srv  1> /var/log/vent.log 2> /var/log/vent.err.log

