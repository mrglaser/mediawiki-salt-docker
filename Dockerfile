# Install LAMP stack and MediaWiki using puppet

# use the latest ubuntu image
FROM ubuntu:12.04

MAINTAINER Markus Glaser "glaser@hallowelt.biz"

ENV MWVERSION 1.24.2
ENV MWDOWNLOADDIR 1.24

ADD ./salt/minion.conf /etc/salt/minon

# update package repository
RUN apt-get update
RUN wget -O - https://bootstrap.saltstack.com | sudo sh

