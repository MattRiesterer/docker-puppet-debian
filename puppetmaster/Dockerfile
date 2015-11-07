FROM debian:latest

MAINTAINER Matthias Riesterer <matthias.riesterer@gmail.com>

WORKDIR /root

RUN apt-get clean \
    && apt-get -y update \
    && apt-get install -y ruby \
      less \
      vim \
      git \
      lsb-release \
      libaugeas-ruby

# clean apt to reduce image size
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN gem install puppet
RUN gem install r10k
RUN gem install puppet-lint

COPY gitconfig /root/.gitconfig

ADD puppet.conf /etc/puppet/puppet.conf

VOLUME ["/opt/puppet"]

#RUN cp -rf /etc/puppet/* /opt/puppet/

VOLUME ["/opt/varpuppet/lib/puppet"]

#RUN cp -rf /var/lib/puppet/* /opt/varpuppet/lib/puppet/

EXPOSE 8140

# ENTRYPOINT [ "/usr/bin/puppet", "master", "--no-daemonize", "--verbose" ]
