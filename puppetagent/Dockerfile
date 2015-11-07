FROM centos:latest

RUN rpm --import https://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs && \
    rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm

RUN yum install yum-utils -y && \
    yum install puppet -y && \
    yum-config-manager --enable centosplus >& /dev/null && \
    yum install git -y && \
    yum clean all

RUN gem install r10k