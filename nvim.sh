#!/usr/bin/env bash
# By mrbitcoiner
############################
set -e
############################
readonly NVIM_DIR="${HOME}/.config/nvim"
readonly NVIM_BKP="${HOME}/.config/nvim.bak"
readonly NVIM_LOCAL="${HOME}/.local/share/nvim"
readonly C_DIR="$(dirname ${0})"
############################
message_disclaimer(){
  printf "To use nvchad, will be great having Nerd Font as your console font\n"
  printf "We won't install the fonts for you, link is down below.\n"
  printf "\nhttps://www.nerdfonts.com/font-downloads\n\n"
  printf "Proceed with nvim setup? y/N: "
  read input
  if printf "${input}" | grep '^y$' > /dev/null; then return 0
  elif printf "${input}" | grep '^N$' > /dev/null; then exit 0
  else printf "Invalid input" 1>&2; return 1; fi
}

rm_if_exists(){
  local path="${1}"
  if [ -z "${path}" ]; then printf "Null path arg" 1>&2; return 1; fi
  if [ -e "${path}" ]; then rm -rf ${path}; fi
}

chown_if_exists(){
  local path="${1}"
  if [ -z "${path}" ]; then printf "Null path arg" 1>&2; return 1; fi
  if [ -e "${path}" ]; then chown -R ${USER} ${path}; fi
}

vim_cfg_backup(){
  chown_if_exists "${NVIM_DIR}"
  chown_if_exists "${NVIM_BKP}"
  chown_if_exists "${NVIM_LOCAL}"
  rm_if_exists "${NVIM_LOCAL}"
  rm_if_exists "${NVIM_BKP}"
  if [ -e "${HOME}/.config/nvim" ]; then
    mv ${NVIM_DIR} ${NVIM_BKP}
    printf "Moved ${NVIM_DIR} to ${NVIM_BKP}\n"
  fi
}

install_nvchad(){
  git clone https://github.com/NvChad/NvChad ${NVIM_DIR} --depth 1
}

nvim_conf(){
  rm_if_exists "${NVIM_DIR}/lua/custom"
  cp -a ${C_DIR}/custom ${NVIM_DIR}/lua/
}

############################
message_disclaimer
vim_cfg_backup
install_nvchad
nvim_conf
