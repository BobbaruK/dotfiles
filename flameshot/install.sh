#!/usr/bin/env bash

install_flameshot() {
  if ! command -v flameshot >/dev/null 2>&1; then
    echo -e "\n	$BG_RED flameshot $RESET ${COLOR_RED}not found. Installing $RESET$BG_RED flameshot $RESET${COLOR_RED} ...$RESET\n"

    sudo apt install -y flameshot
    
    echo -e "\n	$BG_GREEN flameshot $RESET$COLOR_GREEN installed$RESET\n"
  else
    echo -e "\n	$BG_GREEN flameshot $RESET ${COLOR_GREEN}already installed$RESET\n"
  fi

  # link_file "flameshot/.config/flameshot/config" ".config/flameshot/config"
}

uninstall_flameshot() {
  if command -v flameshot >/dev/null 2>&1; then

    echo -e "\n	${COLOR_RED}Purging $RESET$BG_RED flameshot $RESET \n"

    sudo apt purge -y flameshot
    sudo apt autoremove -y
    # rm -rf "$HOME/.config/flameshot"
  
    echo -e "\n	$BG_GREEN flameshot $RESET$COLOR_GREEN removed$RESET\n"

  else
    echo -e "\n	$BG_GREEN flameshot $RESET ${COLOR_GREEN}missing.$RESET\n"
  fi
}