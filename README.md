# docker puppet debian
Simple Dockerfile based on Debian Jessie with puppet 4.2.3 installed via ruby gem.

## Usage

> docker pull mattriesterer/docker-puppet-debian

## Puppet Development

You'll develop on your host and use the docker container to run puppet. By doing
so your own host stays clean.

In the instructions below, the prompt indicates where to run the commands.

> host

refers to your own machine, the docker host. This is where you got your preferred
development tools.

> docker

refers to the docker container. This is where you apply your puppet configuration to.


### Directory Structure


Later on you will mount the directory you develop modules in to the docker
container. Start by creating your base directory:

> host:~/$ mkdir puppet-dev

> host:~/$ cd puppet-dev

### Generate the module base layout

> host:~/puppet-dev/$ puppet module generate

https://docs.puppetlabs.com/puppet/latest/reference/modules_fundamentals.html

### Start container

Mount your puppet-dev base dir to a folder in the container (e.g. /root/src):

> host:~/puppet-dev/$ docker run -it --rm -v $(pwd):/root/src mattriesterer/docker-puppet-debian

By passing '-it' the container keeps running and your logged in to your container now.
You should see something like

> root@07e854d09c79:~#

As your puppet-dev directory is mounted to the container by passing in '-v', all changes
done on your host are immediately available on the container (and vice versa).

### Include access keys in container
The first thing you'll probably do is to run 'r10k' which fetches required modules
from source repositories. If keys are required to access source repositories, mount
your personal keys to the container as well

> host:~/puppet-dev/$ docker run -it --rm -v $(pwd):/root/src -v ~/.ssh:/root/.ssh mattriesterer/docker-puppet-debian

Then make the ssh-agent available

> docker:~/$ eval $(ssh-agent)

and add your key

> docker:~/$ ssh-add .ssh/YOUR-KEY

## Running puppet

First switch to your puppet code directory and run 'r10k' to fetch required modules

> docker:~/$ cd src

> docker:~/src/$ r10k puppetfile install

Now you're ready to run puppet. You got to include the modules fetched by 'r10k'
by passing the 'modulepath' parameter. The location of the modules is defined by
'moduledir' in the 'Puppetfile'. Assuming it is set to 'external_modules' your command
to run puppet looks like this:

> docker:~/src/$ puppet apply --modulepath=external_modules site.pp

## Checking code quality

puppet-lint is provided with this image and puppet parser validate is provided by puppet.
Use them.
