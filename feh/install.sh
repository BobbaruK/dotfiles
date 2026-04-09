#!/usr/bin/env bash

install_feh() {
  if ! command -v feh >/dev/null 2>&1; then
    echo -e "\n	$BG_RED feh $RESET ${COLOR_RED}not found. Installing $RESET$BG_RED feh $RESET${COLOR_RED} ...$RESET\n"

    sudo apt install -y feh
    ``
    echo -e "\n	$BG_GREEN feh $RESET$COLOR_GREEN installed$RESET\n"
  else
    echo -e "\n	$BG_GREEN feh $RESET ${COLOR_GREEN}already installed$RESET\n"
  fi

  # link_file "i3/.config/feh/config" ".config/feh/config"
}

uninstall_feh() {
  if command -v feh >/dev/null 2>&1; then

    echo -e "\n	${COLOR_RED}Purging $RESET$BG_RED feh $RESET \n"

    sudo apt purge -y feh
    sudo apt autoremove -y
    # rm -rf "$HOME/.config/feh"
  
    echo -e "\n	$BG_GREEN feh $RESET$COLOR_GREEN removed$RESET\n"

  else
    echo -e "\n	$BG_GREEN feh $RESET ${COLOR_GREEN}missing.$RESET\n"
  fi
}