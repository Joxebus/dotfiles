export VISUAL=nvim
export EDITOR=nvim
export SUDO_EDITOR=nvim

export GO_PATH=$PATH:/$HOME/go/bin
export RUBY_PATH=$PATH:/$HOME/.gem/ruby/2.6.0/bin
export NODE_PATH=$PATH:/$HOME/.npmglobal/bin
export YARN_PATH=$PATH:/$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin

export LANG=en_US.UTF-8
export PATH=$PATH:$NODE_PATH:$GO_PATH:$RUBY_PATH:$YARN_PATH

#Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Colorls
source $(dirname $(gem which colorls))/tab_complete.sh

# Init starship prompt
eval "$(starship init zsh)"
