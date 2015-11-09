# ~/.bashrc: executed by bash(1) for non-login shells.

# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
# PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
# umask 022

# You may uncomment the following lines if you want `ls' to be colorized:
export LS_OPTIONS='--color=auto'
#eval "`dircolors`"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'

# Some more alias to avoid making mistakes:
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'

# ensure helper scripts can be accessed
export PATH="$PATH:/root/bin"

# ensure package info is current so that puppet can find
# packages to be installed
if [ "$(ls -A /var/lib/apt/lists >/dev/null 2>&1)" == "" ]; then
    apt-get update
fi

# ensure SSH agent is running and keys are loaded when
# .ssh folder is present
if [ -d /root/.ssh ]; then
    SSH_ENV="/root/.ssh/environment"
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}"
    /usr/bin/ssh-add;
fi

