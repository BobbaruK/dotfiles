#!/usr/bin/env bash

install_i3status() {
  if ! command -v i3status >/dev/null 2>&1; then
    echo -e "\n	$BG_RED i3status $RESET ${COLOR_RED}not found. Installing $RESET$BG_RED i3status $RESET${COLOR_RED} ...$RESET \n"

    sudo apt install -y i3status
    
    echo -e "\n	$BG_GREEN i3status $RESET$COLOR_GREEN installed$RESET\n"
  else
    echo -e "\n	$BG_GREEN i3status $RESET ${COLOR_GREEN}already installed$RESET\n"
  fi

  link_file "i3status/.config/i3status/config" ".config/i3status/config"
}

uninstall_i3status() {
  if command -v i3status >/dev/null 2>&1; then

    echo -e "\n	${COLOR_RED}Purging $RESET$BG_RED i3status $RESET \n"

    sudo apt purge -y i3status
    sudo apt autoremove -y
    rm -rf "$HOME/.config/i3status"
  
    echo -e "\n	$BG_GREEN i3status $RESET$COLOR_GREEN removed$RESET\n"

  else
    echo -e "\n	$BG_GREEN i3status $RESET ${COLOR_GREEN}missing.$RESET\n"
  fi
}