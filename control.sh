#!/usr/bin/env bash
# By mrbitcoiner
############################
set -e 
############################
readonly DEPENDENCIES=("nvim" "lua" "git" "sudo" "cargo")
readonly C_DIR="$(dirname ${0})"
############################
check_dependencies(){
  for i in "${DEPENDENCIES[@]}"; do
    if ! which "${i}" > /dev/null; then printf "Please install ${i}" 1>&2; return 1; fi
  done
}

setup_permissions(){
  chmod +x "${C_DIR}"/*.sh
}

help_message(){
  printf "Usage: [ setup | --help ]"
}

setup(){
  setup_permissions
  ${C_DIR}/nvim.sh
  printf "Opening nvim in 5 seconds, wait the dependencies install process.\n"
  printf "Exit nvim after that!\n"
  sleep 5
  nvim
  printf "\nReady to rock!\n"
}
############################
case "${1}" in
  "setup") setup ;;
  "--help" | "-h") printf "$(help_message)\n"; exit 0 ;;
  *) printf "$(help_message)" 1>&2; exit 1;
esac
