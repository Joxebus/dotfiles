source $HOME/antigen.zsh
    
# Load the oh-my-zsh's library
antigen use oh-my-zsh

# Antigen plugins
antigen bundle git
antigen bundle colored-man-pages
antigen bundle ssh-agent
antigen bundle sublime
antigen bundle systemd
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle akoenig/gulp.plugin.zsh

# Tell antigen that you're done
antigen apply

## use the vi navigation keys (hjkl) besides cursor keys in menu completion
bindkey -M menuselect 'h' vi-backward-char        # left
bindkey -M menuselect 'k' vi-up-line-or-history   # up
bindkey -M menuselect 'l' vi-forward-char         # right
bindkey -M menuselect 'j' vi-down-line-or-history # bottom

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

# Sourcing extras
source ~/.local/share/icons-in-terminal/icons_bash.sh 
source $HOME/.oh-my-zsh/plugins/zsh-git-prompt/zshrc.sh
source $HOME/.bash_aliases

# Common configs
export WTF_OWM_API_KEY="f776691e95a4e448f083249e013ff4f1"
export LANG=en_US.UTF-8
export GOPATH=$HOME/golang/
export PATH=$PATH:/usr/local/bin/node/bin:/home/sigfried/.npmglobal/bin:$HOME/develop/tests/depot_tools/:$HOME/develop/tests/shaka-packager/src/out/Release/
export VISUAL=vim
export EDITOR=vim

#Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

zstyle :omz:plugins:ssh-agent identities id_ecdsa jmjc_rsa limag.pem digital

local ret_status="%(?:%{$fg_bold[green]%}λ :%{$fg_bold[red]%}➜ )"
PROMPT='%{$fg[cyan]%}%c%{$reset_color%} $(git_super_status) ${ret_status} $reset_color'