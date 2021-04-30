#!/bin/sh -eux

: << COMMENT_OUT
This scripts target shell is only zsh , so if you want to use script for bash , please regulation yourself .
for example .zshrc -> .bashrc

- Attention notice
If you already setting .zshrc , this script remove your setting .
COMMENT_OUT

ln -fs "$(pwd)"/zshrc ~/.zshrc
ln -fs "$(pwd)"/vimrc ~/.vimrc

cp gitconfig_addon ~/.gitconfig
git config --global user.name "$(whoami)"
if [ -z "${1:-""}" ]; then
  printf "No email setting."
else
  git config --global user.email "$1"
fi

mkdir -p ~/.zsh/completion
cd ~/.zsh/completion
curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

curl -O https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker
curl -O https://raw.githubusercontent.com/docker/compose/"$(docker-compose version --short)"/contrib/completion/zsh/_docker-compose

mkdir -p ~/.vim/autoload
cd ~/.vim/autoload
curl -O https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
