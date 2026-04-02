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

PS3="Ce vrei? Alege: "

select opt in "Install" "Uninstall" "O lume mai buna"; do
  case $opt in
    "Install")
      echo -e "$BG_GREEN Installing... $RESET"
      install_git
      install_curl
      install_zsh
      install_oh_my_zsh
      install_nvm_and_node
      install_docker_desktop
      install_vs_code_and_extensions
      
      mkdir -p "$BACKUP_DIR"
      symlink_dotfiles

      outro_install
      break
      ;;
    "Uninstall")
      echo -e "$BG_GREEN Uninstalling... $RESET"
      uninstall_git
      uninstall_curl
      uninstall_zsh
      uninstall_oh_my_zsh
      uninstall_nvm_and_node
      uninstall_docker
      uninstall_vscode
      outro_uninstall
      break
      ;;
    "O lume mai buna")
      echo -e "\n$BG_GREEN Hai pa, ma, prostule! $RESET\n"
      break
      ;;
    *)
      echo "Opțiune invalidă"
      ;;
  esac
done

# sudo apt update

# install_git
# install_curl
# install_zsh
# install_oh_my_zsh
# install_nvm_and_node
# install_docker_desktop
# install_vs_code_and_extensions

# mkdir -p "$BACKUP_DIR"

# symlink_dotfiles

# outro
