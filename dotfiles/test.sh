#!/bin/bash -eu

function check_exit_status() {
  if [ "$1" != 0 ]; then
    exit 1
  fi
}

function check_equal_file() {
  local src
  local target
  src=$(shasum -a 256 "$1" | awk '{print $1}')
  target=$(shasum -a 256 "$2" | awk '{print $1}')
  test "${src}" = "${target}"
}

function check_file_existence() {
  test -f "$1"
}

function do_test() {
  shellcheck start_setting.sh
  check_exit_status $?

  shellcheck test.sh
  check_exit_status $?

  ./start_setting.sh
  check_exit_status $?

  check_equal_file zshrc ~/.zshrc
  check_exit_status $?

  check_equal_file vimrc ~/.vimrc
  check_exit_status $?

  check_file_existence ~/.zsh/completion/_docker
  check_exit_status $?

  check_file_existence ~/.zsh/completion/_docker-compose
  check_exit_status $?

  check_file_existence ~/.zsh/completion/git-prompt.sh
  check_exit_status $?

  check_file_existence ~/.gitconfig
  check_exit_status $?

  vint vimrc
  check_exit_status $?

  grunt zshlint
  check_exit_status $?
}

function main() {
  do_test
  do_test
}

main
