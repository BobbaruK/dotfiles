#!/usr/bin/env bash

install_picom() {
  if ! command -v picom >/dev/null 2>&1; then
    echo -e "\n	$BG_RED picom $RESET ${COLOR_RED}not found. Installing $RESET$BG_RED picom $RESET${COLOR_RED} ...$RESET \n"

    sudo apt install -y picom
    ``
    echo -e "\n	$BG_GREEN picom $RESET$COLOR_GREEN installed$RESET\n"
  else
    echo -e "\n	$BG_GREEN picom $RESET ${COLOR_GREEN}already installed$RESET\n"
  fi

  link_file "picom/.config/picom/picom.conf" ".config/picom/picom.conf"
}

uninstall_picom() {
  if command -v picom >/dev/null 2>&1; then

    echo -e "\n	${COLOR_RED}Purging $RESET$BG_RED picom $RESET \n"

    sudo apt purge -y picom
    sudo apt autoremove -y
    rm -rf "$HOME/.config/picom/"
  
    echo -e "\n	$BG_GREEN picom $RESET$COLOR_GREEN removed$RESET\n"

  else
    echo -e "\n	$BG_GREEN picom $RESET ${COLOR_GREEN}missing.$RESET\n"
  fi
}