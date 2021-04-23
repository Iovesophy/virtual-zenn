#!/bin/sh -eux

: << COMMENT_OUT
This scripts target shell is only zsh , so if you want to use script for bash , please regulation yourself .
for example .zshrc -> .bashrc

- Attention notice
If you already setting .zshrc , this script remove your setting .
COMMENT_OUT
printf "************************************************\n"
printf "Welcome to dotfile-initset-script ver: 1.0\n"
printf "Caution! , this script support only macOS's zsh .\n"
printf "************************************************\n"

printf "Make .zshrc on home\n"
ln -fs "$(pwd)"/zshrc ~/.zshrc
printf "Make .vimrc on home\n"
ln -fs "$(pwd)"/vimrc ~/.vimrc

printf "Setting global user.name , user.email\n"
printf "Add whoami username to user.name\n"
printf "*********\n"
whoami
printf "*********\n"
cp gitconfig_addon ~/.gitconfig
git config --global user.name "$(whoami)"
if [ -z "${1:-""}" ]; then
  printf "No email setting.\n"
else
  git config --global user.email "$1"
fi

printf "Download git-prompt.sh\n"
mkdir -p ~/.zsh/completion
cd ~/.zsh/completion
curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

printf "docker\n"
curl -O https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker
curl -O https://raw.githubusercontent.com/docker/compose/"$(docker-compose version --short)"/contrib/completion/zsh/_docker-compose

mkdir -p ~/.vim/autoload
cd ~/.vim/autoload
curl -O https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

printf "Done , Please check any setting files yourself .\n"
printf "Start your happy Coding life .\n"
