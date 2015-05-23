# Install LAMP stack and MediaWiki using puppet

# use the latest ubuntu image
FROM saltstack/ubuntu-14.04

MAINTAINER Markus Glaser "glaser@hallowelt.biz"
MAINTAINER Tyler Cipriani "tcipriani@wikimedia.org"

ENV MWVERSION 1.24.2
ENV MWDOWNLOADDIR 1.24

ADD salt/minion.conf /etc/salt/minion

# Provision with salt
RUN apt-get update
RUN apt-get install -y -o DPkg::Options::=--force-confold salt-minion
RUN salt-call cmd.run 'uname'
