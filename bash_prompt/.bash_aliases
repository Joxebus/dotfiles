alias ..1='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ls='ls -lFh --sort=extension --color=auto'
alias lc='ls -lhC --sort=extension --color=auto'
alias ip='ifconfig | grep Bcast'
alias vimr='vim ~/.vimrc'
alias bashr='vim ~/.bashrc && source ~/.bashrc'
alias esl='sudo vim /etc/apt/sources.list'
#included in init.d
#alias mongod='mongod --dbpath ~/data/db'
#Develop's alias
alias dev='cd /home/sigfried/development/isoFact/workspace'
alias midgard='cd /media/sigfried/Midgard'
#
alias angular-doc='http-server ~/development/utils/angular-1.5.3/docs/'
alias search='apt-cache search'
alias sum_md5='find . -exec md5sum '{}' \; >> md5.txt'
alias ports='netstat -tlnap'
alias total-space='du -hs'
alias update='sudo apt-get update && sudo apt-get upgrade'
alias nginxrestart='sudo service nginx restart'
alias nginxstart='sudo service nginx start'
alias cntlmrestart='sudo service cntlm restart'
#iptables alias
alias fwup='sudo iptables-apply /home/sigfried/system_configs/rules.v4'
alias fwdown='sudo iptables -F;sudo iptables -P INPUT ACCEPT;sudo iptables -P FORWARD ACCEPT'
alias fwlist='sudo iptables -L'
#VirtualEnvs
alias activate='. bin/activate'
alias workon='virtualenv'
alias workoff='deactivate'

#PS1=" \[\e[1;37m\][\[\e[1;36m\] \d \[\e[1;31m\]\T \[\e[1;37m\]] \n\[\e[1;37m\] [ \[\e[1;34m\]\u@\H \[\e[1;32m\]\w\[\e[1;37m\]]\[\e[1;35m\] λ \[\e[0;37m\]"

export EDITOR=vim
export VISUAL=vim
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

#Reprepro configurations
export REPREPRO_BASE_DIR=/home/sigfried/reprepro
export REPREPRO_CONFIG_DIR=/home/sigfried/reprepro/conf
#Reprepro configurations

GIT_PROMPT_ONLY_IN_REPO=1
source ~/bash-git-prompt-master/gitprompt.sh
source ~/development/bash_prompt/bash_prompt-master/prompt_command

alias find_lost_souls="nmap -n  -p3128 10.8.0.0/16 --open --oG - -T4 | grep squid | grep -Po 'Host: \K\d.*?(?= )' | xargs -n 1 -I host bash -c 'if curl --proxy1.0 host:3128 --silent --head http://www.google.com/ | grep \"Location:http://www.google.com.cu/\" > /dev/null ; then echo host; fi'"
