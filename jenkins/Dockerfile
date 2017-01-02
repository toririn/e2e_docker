FROM jenkins:2.32.1

# change user \
USER root

# apt-get modify
RUN apt-get update && apt-get -y upgrade

# setup ssh
RUN apt-get install -y sshpass
