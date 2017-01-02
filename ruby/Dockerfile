FROM ruby:2.4

ARG password

# apt-get modify
RUN apt-get update && apt-get -y upgrade

# setup vim
RUN apt-get install -y vim

# setup ssh
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
## setup environment scripts for ssh login
COPY set_env.sh /tmp/set_env.sh
RUN chmod 755 /tmp/set_env.sh && echo 'source /tmp/set_env.sh' >> /root/.bashrc
## change root password for ssh
RUN echo root:${password} | chpasswd

# setup bundle
COPY . /usr/src/app
WORKDIR /usr/src/app
RUN bundle install

# expose ssh ports
expose 22

# sshd start
CMD ["/usr/sbin/sshd", "-D"]
