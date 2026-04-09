#!/usr/bin/env bash

install_brightnessctl() {
  if ! command -v brightnessctl >/dev/null 2>&1; then
    echo -e "\n	$BG_RED brightnessctl $RESET ${COLOR_RED}not found. Installing $RESET$BG_RED brightnessctl $RESET${COLOR_RED} ...$RESET\n"

    sudo apt install -y brightnessctl
    
    echo -e "\n	$BG_GREEN brightnessctl $RESET$COLOR_GREEN installed$RESET\n"
  else
    echo -e "\n	$BG_GREEN brightnessctl $RESET ${COLOR_GREEN}already installed$RESET\n"
  fi

  # link_file "brightnessctl/.config/brightnessctl/config" ".config/brightnessctl/config"
}

uninstall_brightnessctl() {
  if command -v brightnessctl >/dev/null 2>&1; then

    echo -e "\n	${COLOR_RED}Purging $RESET$BG_RED brightnessctl $RESET \n"

    sudo apt purge -y brightnessctl
    sudo apt autoremove -y
    # rm -rf "$HOME/.config/brightnessctl"
  
    echo -e "\n	$BG_GREEN brightnessctl $RESET$COLOR_GREEN removed$RESET\n"

  else
    echo -e "\n	$BG_GREEN brightnessctl $RESET ${COLOR_GREEN}missing.$RESET\n"
  fi
}