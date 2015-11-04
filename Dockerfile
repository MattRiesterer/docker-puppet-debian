FROM debian:jessie

MAINTAINER Matthias Riesterer <matthias.riesterer@gmail.com>

WORKDIR /root

ENV PUPPET_PACKAGE puppetlabs-release-pc1-jessie.deb

ADD https://apt.puppetlabs.com/$PUPPET_PACKAGE /root/

RUN dpkg -i $PUPPET_PACKAGE

RUN rm $PUPPET_PACKAGE

RUN apt-get clean \
    && apt-get -y update \
    && apt-get install -y puppet \
      less \
      vim \
      git

# clean apt to reduce image size
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN gem install r10k

RUN gem install puppet-lint

COPY gitconfig /root/.gitconfig
