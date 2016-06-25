# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac


if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto -i'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#Command's alias
alias .1='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias ls='ls -lh --sort=extension --color=auto'
alias lc='ls -lhC --sort=extension --color=auto'
alias ip='ifconfig | grep Bcast'
alias vimr='vim ~/.vimrc'
alias bashr='vim ~/.bashrc && source ~/.bashrc'
#included in init.d
#alias mongod='mongod --dbpath ~/data/db'
alias dev='cd /home/sigfried/development/isoFact/workspace'
alias mid='cd /media/sigfried/Midgard'
alias angular-doc='http-server ~/Downloads/angular-1.5.3/docs/'
alias search='apt-cache search'
alias sum_md5='find . -exec md5sum '{}' \; >> md5.txt'
alias ports='netstat -tlnap'
alias total-space='du -h'
alias update='sudo apt-get update && sudo apt-get upgrade'
alias install='sudo apt-get install'
alias nginxrestart='sudo service nginx restart'
alias nginxstart='sudo service nginx start'
alias fwup='sudo iptables-apply /home/sigfried/system_configs/rules.v4'
alias iptlist='sudo iptables -L'
alias rm='rm -rfi'
function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

PS1=" \[\e[1;37m\][\[\e[1;36m\] \d \[\e[1;31m\]\T \[\e[1;37m\]] \n\[\e[1;37m\] [ \[\e[1;34m\]\u@\H \[\e[1;32m\]\w \[\e[1;37m\]]\[\e[1;35m\] λ \[\e[0;37m\]"

export EDITOR=vim
export VISUAL=vim
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export REPREPRO_BASE_DIR=/home/sigfried/reprepro

GIT_PROMPT_ONLY_IN_REPO=1
source ~/bash-git-prompt-master/gitprompt.sh
