#!/usr/bin/env bash

set -e

DOTFILES_DIR="$HOME/.dotfiles"
BACKUP_DIR="$DOTFILES_DIR/backups"

source "$HOME/.dotfiles/lib/core/colors.sh"
source "$HOME/.dotfiles/lib/core/utils/link-file.sh"
source "$HOME/.dotfiles/lib/core/utils/set-default-shell.sh"

for file in "$DOTFILES_DIR"/lib/install/*.sh; do
  source "$file"
done

sudo apt update

install_git
install_curl
install_zsh
install_oh_my_zsh
install_nvm_and_node
install_docker_desktop
install_vs_code_and_extensions

mkdir -p "$BACKUP_DIR"

symlink_dotfiles

outro
