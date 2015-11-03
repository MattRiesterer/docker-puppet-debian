FROM debian:jessie

MAINTAINER Matthias Riesterer <matthias.riesterer@gmail.com>

WORKDIR /root

ADD https://apt.puppetlabs.com/puppetlabs-release-jessie.deb /root/

RUN dpkg -i puppetlabs-release-jessie.deb

RUN apt-get -y update \
    && apt-get install -y puppet \
      less \
      vim \
      git

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN gem install r10k

RUN gem install puppet-lint

COPY gitconfig /root/.gitconfig
