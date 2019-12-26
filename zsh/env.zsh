export VISUAL=vim
export EDITOR=vim
export SUDO_EDITOR=vim

export GOPATH=$PATH:/$HOME/go/bin

export LANG=en_US.UTF-8
export PATH=$PATH:/$HOME/.npmglobal/bin/:$GOPATH

#Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
source $(dirname $(gem which colorls))/tab_complete.sh
eval "$(starship init zsh)"
