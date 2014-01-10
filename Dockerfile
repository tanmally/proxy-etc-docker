FROM ubuntu
MAINTAINER bbytes  "info@beyondbytes.co.in"

RUN apt-get install -y python-software-properties python
RUN add-apt-repository ppa:chris-lea/node.js
RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ precise universe" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y nodejs

RUN mkdir /opt/bbytes
RUN cd /opt/bbytes
RUN apt-get install -y git-core
RUN git clone https://github.com/bbytes/proxy-etc.git /opt/bbytes/proxy-etc
RUN cd /opt/bbytes/proxy-etc
RUN mkdir /opt/bbytes/proxy-etc/data
RUN cd /opt/bbytes/proxy-etc; npm install

RUN  npm install -g forever

EXPOSE 80
EXPOSE 3333

CMD ["forever","start", "/opt/bbytes/proxy-etc/app.js"]
