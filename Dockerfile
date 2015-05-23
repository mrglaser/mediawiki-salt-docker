# Install LAMP stack and MediaWiki using puppet

# use the latest ubuntu image
FROM ubuntu:12.04

MAINTAINER Markus Glaser "glaser@hallowelt.biz"

ENV MWVERSION 1.24.2
ENV MWDOWNLOADDIR 1.24

# update package repository
RUN apt-get update

# install mysql
RUN apt-get install -y mysql-server mysql-client

# install apache
RUN apt-get install -y apache2 apache2-mpm-prefork apache2-utils apache2.2-common

# install php
RUN apt-get install -y libapache2-mod-php5 mysql-common php5-common php5-mysql

# install wget
RUN apt-get install -y wget

# install vim
RUN apt-get install -y vim

# download mediawiki
RUN wget http://releases.wikimedia.org/mediawiki/$MWDOWNLOADDIR/mediawiki-$MWVERSION.tar.gz && mv mediawiki-$MWVERSION.tar.gz /var/www

# Add start script
ADD ./scripts/docker-entrypoint.sh /docker-entrypoint.sh

# unpack and move mediawiki
RUN tar -xzvf /var/www/mediawiki-$MWVERSION.tar.gz --directory /var/www
RUN mv /var/www/mediawiki-$MWVERSION /var/www/wiki
RUN chmod -R 777 /var/www/wiki
RUN rm /var/www/mediawiki-$MWVERSION.tar.gz

# make port 80 available
EXPOSE 80

# run start script
ENTRYPOINT ["/bin/bash", "/docker-entrypoint.sh"]