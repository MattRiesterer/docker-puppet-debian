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

ENV PUPPET_VERSION 3.7.4

# RUN rpm --import https://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs && rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
# RUN yum install -y yum-utils && yum-config-manager --enable centosplus >& /dev/null
# RUN yum install -y puppet-$PUPPET_VERSION
# RUN yum install -y puppet-server-$PUPPET_VERSION
# RUN yum install -y openssh-server
# RUN yum install -y python-setuptools
# RUN yum clean all

RUN easy_install supervisor

ADD puppet.conf /etc/puppet/puppet.conf

VOLUME ["/opt/puppet"]

RUN cp -rf /etc/puppet/* /opt/puppet/

VOLUME ["/opt/varpuppet/lib/puppet"]

RUN cp -rf /var/lib/puppet/* /opt/varpuppet/lib/puppet/

COPY supervisord.conf /etc/supervisord.conf

EXPOSE 8140

CMD /usr/bin/supervisord
