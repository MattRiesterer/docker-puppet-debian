# docker puppet debian
Simple Dockerfile based on Debian Jessie with puppet agent installed the way puppetlabs describes it on https://docs.puppetlabs.com/guides/install_puppet/install_debian_ubuntu.html

## Usage

> docker pull mattriesterer/docker-puppet-debian

## Puppet Development

### Directory Structure
Later on you will mount the directory you develop modules in to the docker
container. Puppet is looking for modules in its modulepath which is /etc/puppet/modules
by default.
To make all this work smoothly, create a base directory for all you puppet development.

> host:~/$ mkdir puppet-dev
> host:~/$ cd puppet-dev

### Generate the module base layout

> host:~/puppet-dev/$ puppet module generate

https://docs.puppetlabs.com/puppet/latest/reference/modules_fundamentals.html

### Start container

Mount your puppet-dev base dir to the modulepath of Puppet

> host:~/puppet-dev/$ docker run -it --rm -v $(pwd):/etc/puppet/modules/ mattriesterer/docker-puppet-debian
