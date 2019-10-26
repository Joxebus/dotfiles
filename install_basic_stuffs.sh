#!/usr/bin/env bash
if [ $USER != "root"  ]; then
    echo "You need root privileges"
    exit 1
fi

apt-get install -y curl
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
curl -L git.io/antigen > $HOME/antigen.zsh
apt-get install -y nodejs zsh

ln -s `pwd`../zsh/zshrc $HOME/.zshrc
ln -s `pwd`../npm/npmrc $HOME/.npmrc

ZSH=$(which zsh)
chsh -s $ZSH

# vim: set filetype=sh :