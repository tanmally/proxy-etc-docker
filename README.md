proxy-etc-docker
================

dockerfile for proxy-etc and tomcat7 

sudo docker build github.com/tanmally/proxy-etc-docker.git

TO RUN 

$ docker run -d -p 3333:3333 -p 80:80 bbytes/proxy-etc
