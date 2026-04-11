#!/usr/bin/env bash

install_fonts_font_awesome() {
  if ! command -v fonts-font-awesome >/dev/null 2>&1; then
    echo -e "\n	$BG_RED fonts-font-awesome $RESET ${COLOR_RED}not found. Installing $RESET$BG_RED fonts-font-awesome $RESET${COLOR_RED} ...$RESET \n"

    sudo apt install -y fonts-font-awesome
    
    echo -e "\n	$BG_GREEN fonts-font-awesome $RESET$COLOR_GREEN installed$RESET\n"
  else
    echo -e "\n	$BG_GREEN fonts-font-awesome $RESET ${COLOR_GREEN}already installed$RESET\n"
  fi

  # link_file "fonts-font-awesome/.config/fonts-font-awesome/config.ini" ".config/fonts-font-awesome/config.ini"
}

uninstall_fonts_font_awesome() {
  if command -v fonts-font-awesome >/dev/null 2>&1; then

    echo -e "\n	${COLOR_RED}Purging $RESET$BG_RED fonts-font-awesome $RESET \n"

    sudo apt purge -y fonts-font-awesome
    sudo apt autoremove -y
    # rm -rf "$HOME/.config/fonts-font-awesome"
  
    echo -e "\n	$BG_GREEN fonts-font-awesome $RESET$COLOR_GREEN removed$RESET\n"

  else
    echo -e "\n	$BG_GREEN fonts-font-awesome $RESET ${COLOR_GREEN}missing.$RESET\n"
  fi
}