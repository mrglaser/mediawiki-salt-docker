# Install LAMP stack and MediaWiki using puppet

# use the latest ubuntu image
FROM saltstack/ubuntu-14.04

MAINTAINER Markus Glaser "glaser@hallowelt.biz"
MAINTAINER Tyler Cipriani "tcipriani@wikimedia.org"

ENV MWVERSION 1.24.2
ENV MWDOWNLOADDIR 1.24

# Install salt
RUN apt-get update
RUN apt-get install -y -o DPkg::Options::=--force-confold salt-minion

# Provision with salt
COPY salt/minion.conf /etc/salt/minion
COPY salt /srv/salt/
RUN salt-call --local state.highstate

