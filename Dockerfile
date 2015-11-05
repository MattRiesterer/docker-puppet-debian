FROM debian:jessie

MAINTAINER Matthias Riesterer <matthias.riesterer@gmail.com>

WORKDIR /root

RUN apt-get clean \
    && apt-get -y update \
    && apt-get install -y ruby \
      less \
      vim \
      git

# clean apt to reduce image size
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN gem install puppet
RUN gem install r10k
RUN gem install puppet-lint

COPY gitconfig /root/.gitconfig
