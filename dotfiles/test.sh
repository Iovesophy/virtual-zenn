#!/bin/bash -eu

function check_exit_status() {
  printf "Status:%s\n" "$1"
  if [ "$1" != 0 ]; then
    exit 1
  fi
}

function check_equal_file() {
  printf "Check_equal_file:[%s]==[%s]\n" "$1" "$2"
  local src
  local target
  src=$(shasum -a 256 "$1" | awk '{print $1}')
  target=$(shasum -a 256 "$2" | awk '{print $1}')
  test "${src}" = "${target}"
}

function check_file_existence() {
  printf "Check_file_existence:%s\n" "$1"
  test -f "$1"
}

function do_test() {
  printf "Check lint start_setting.sh\n"
  shellcheck start_setting.sh
  check_exit_status $?

  printf "Check lint test.sh\n"
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

  printf "Check .vimrc\n"
  vint vimrc
  check_exit_status $?

  printf "Check .zshrc\n"
  grunt zshlint
  check_exit_status $?
}

function main() {
  printf "************************************************\n"
  printf "Welcome to dotfile-test-script ver: 1.0\n"
  printf "************************************************\n"

  do_test
  do_test

  printf '\033[32m%s\033[m\n' 'Done. Test All Clear.'
}

main
