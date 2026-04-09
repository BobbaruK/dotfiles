#!/usr/bin/env bash

set -e

DOTFILES_DIR="$HOME/.dotfiles"
BACKUP_DIR="$DOTFILES_DIR/backups"

source "$HOME/.dotfiles/lib/core/utils/link-file.sh"
source "$HOME/.dotfiles/lib/core/utils/set-default-shell.sh"
source "$HOME/.dotfiles/lib/core/colors.sh"
source "$HOME/.dotfiles/lib/core/outro.sh"

for file in "$DOTFILES_DIR"/*/install.sh; do
  source "$file"
done

PS3="Ce vrei? Alege: "

select opt in "Install" "Uninstall" "O lume mai buna"; do
  case $opt in
    "Install")
      echo -e "$BG_GREEN Installing... $RESET"

      # sudo apt update

      mkdir -p "$BACKUP_DIR"

      install_git
      install_curl
      install_zsh
      install_oh_my_zsh
      install_nvm_and_node
      install_docker_desktop
      install_vs_code_and_extensions
      install_libreoffice

      install_i3
      install_i3status
      install_i3lock

      install_alacritty
      install_feh
      install_picom

      install_rofi
      install_lxappearance
      link_file "gtk-3.0/.config/gtk-3.0/settings.ini" ".config/gtk-3.0/settings.ini"
      install_flameshot
      install_pavucontrol
      install_dunst
      install_brightnessctl
      install_thunar
      install_polybar

      install_arc_theme
      install_papirus_icon_theme

      install_fonts_jetbrains_mono
      install_fonts_font_awesome

      link_file "profile/profile" ".profile"

      install_arandr

      outro_install
      break
      ;;
    "Uninstall")
      echo -e "$BG_GREEN Uninstalling... $RESET"
      
      # sudo apt update

      uninstall_git
      uninstall_curl
      uninstall_zsh
      uninstall_oh_my_zsh
      uninstall_nvm_and_node
      uninstall_docker
      uninstall_vscode
      uninstall_libreoffice
      
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