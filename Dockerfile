FROM ubuntu:14.04
MAINTAINER support@tutum.co
RUN apt-get update && apt-get install -y curl
RUN curl -o /usr/bin/btsync.tar.gz http://download-lb.utorrent.com/endpoint/btsync/os/linux-x64/track/stable
RUN cd /usr/bin && tar -xzvf btsync.tar.gz && rm btsync.tar.gz
RUN mkdir -p /btsync/.sync
EXPOSE 55555
ADD start-btsync /usr/bin/start-btsync
RUN chmod +x /usr/bin/start-btsync
ENTRYPOINT ["start-btsync"]