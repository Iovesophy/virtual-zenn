From node
ENV LANG="ja_JP.UTF-8" LANGUAGE="ja_JP:ja" LC_ALL="ja_JP.UTF-8"

WORKDIR /virtual-zenn

RUN apt-get update \
      && apt-get -y install \
        vim \
        python3-pip \
        zsh \
        shellcheck \
      && git init \
      && git remote add origin https://github.com/Iovesophy/virtual-zenn.git \
      && git pull origin master \
      && npm init --yes \
      && npm install -g grunt-cli \
      && npm install \
        grunt \
        grunt-zshlint \
        zenn-cli \
      && npx zenn init

WORKDIR /dotfiles

RUN pip3 install --upgrade pip \
      && pip3 install vim-vint \
      && npm install -g grunt-cli \
      && npm install \
        grunt \
        grunt-zshlint \
      && git init \
      && git remote add origin https://github.com/Iovesophy/dotfiles.git \
      && git pull origin add-dotfiles-vm

RUN ./test.sh

WORKDIR /virtual-zenn
