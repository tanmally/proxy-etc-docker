FROM bbytes/nodejs-tomcat7
MAINTAINER bbytes  "info@beyondbytes.co.in"

RUN mkdir /opt/bbytes
RUN cd /opt/bbytes
RUN apt-get install -y git-core
RUN git clone https://github.com/bbytes/proxy-etc.git /opt/bbytes/proxy-etc
RUN cd /opt/bbytes/proxy-etc
RUN mkdir /opt/bbytes/proxy-etc/data
RUN cd /opt/bbytes/proxy-etc; npm install
RUN  npm install -g forever

EXPOSE 8080
EXPOSE 80
EXPOSE 3333

RUN easy_install supervisor
RUN echo_supervisord_conf > /etc/supervisord.conf
RUN printf "[include]\nfiles = /opt/bbytes/Supervisorfile\n" >> /etc/supervisord.conf

ADD . /opt/bbytes
CMD ["/usr/local/bin/supervisord","-n", "-c", "/etc/supervisord.conf"]
