#!/bin/sh

# ensure package info is current so that puppet can find
# packages to be installed
apt-get update

# ensure SSH agent is running and keys are loaded when
# .ssh folder is present
if [ -d /root/.ssh ]; then
    eval $(ssh-agent)
    ssh-add
fi

