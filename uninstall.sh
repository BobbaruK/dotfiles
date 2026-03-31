#!/usr/bin/env bash
set -e

DOTFILES_DIR="$HOME/.dotfiles"
BACKUP_DIR="$DOTFILES_DIR/backups"

source "$HOME/.dotfiles/lib/core/colors.sh"

for file in "$DOTFILES_DIR"/lib/install/*.sh; do
  source "$file"
done

sudo apt update

uninstall_git
uninstall_curl
uninstall_zsh
uninstall_oh_my_zsh
uninstall_nvm_and_node
uninstall_docker
uninstall_vscode

echo -e "$BG_GREEN Cleanup done. Re-login recommended. $RESET"

echo -e "\n"

echo -e "Press ${BG_GREEN} Ctrl+C $RESET to ${UNDERLINE}abort${RESET}."

for i in {10..0}; do
echo -ne "\r${BG_RED} Executing pkill, killing all user processes $RESET ... $BG_RED $i $RESET"
  sleep 1
done

echo -e "\n"

pkill -KILL -u "$USER"
