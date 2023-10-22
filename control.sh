#!/usr/bin/env bash
############################
set -e 
############################
readonly NVIM_DIR="${HOME}/.config/nvim"
readonly NVIM_SHARE_DIR="${HOME}/.local/share/nvim"
readonly CURRENT_DIR="$(dirname $0)"
############################
setup(){
	if [ -e "${NVIM_SHARE_DIR}" ]; then
		rm -rf "${NVIM_SHARE_DIR}"
	fi
	if [ -e "${NVIM_DIR}.bak" ]; then
		rm -rf "${NVIM_DIR}.bak"
	fi
	if [ -e "${NVIM_DIR}" ]; then
		mv "${NVIM_DIR}" "${NVIM_DIR}.bak"
	fi
	cp -a "${CURRENT_DIR}/nvim" "${NVIM_DIR}"
}
############################
case "${1}" in
  "setup") setup ;;
  *) printf "Usage: < setup | help >\n" 1>&2; exit 1;
esac
