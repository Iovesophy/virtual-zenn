FROM node
WORKDIR /dotfiles

RUN apt-get update \
      && apt-get -y install \
        docker-compose \
        python3-pip \
        shellcheck \
        zsh \
      && pip3 install --upgrade pip \
      && pip3 install vim-vint \
      && npm install -g grunt-cli \
      && npm install \
        grunt \
        grunt-zshlint

COPY . .

CMD ["./test.sh"]
