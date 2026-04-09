#!/usr/bin/env bash

install_thunar() {
  if ! command -v thunar >/dev/null 2>&1; then
    echo -e "\n	$BG_RED thunar $RESET ${COLOR_RED}not found. Installing $RESET$BG_RED thunar $RESET${COLOR_RED} ...$RESET\n"

    sudo apt install -y thunar
    
    echo -e "\n	$BG_GREEN thunar $RESET$COLOR_GREEN installed$RESET\n"
  else
    echo -e "\n	$BG_GREEN thunar $RESET ${COLOR_GREEN}already installed$RESET\n"
  fi

  # link_file "thunar/.config/thunar/config" ".config/thunar/config"
}

uninstall_thunar() {
  if command -v thunar >/dev/null 2>&1; then

    echo -e "\n	${COLOR_RED}Purging $RESET$BG_RED thunar $RESET \n"

    sudo apt purge -y thunar
    sudo apt autoremove -y
    # rm -rf "$HOME/.config/thunar"
  
    echo -e "\n	$BG_GREEN thunar $RESET$COLOR_GREEN removed$RESET\n"

  else
    echo -e "\n	$BG_GREEN thunar $RESET ${COLOR_GREEN}missing.$RESET\n"
  fi
}