#!/usr/bin/env bash

install_fonts_jetbrains_mono() {
  if ! command -v fonts-jetbrains-mono >/dev/null 2>&1; then
    echo -e "\n	$BG_RED fonts-jetbrains-mono $RESET ${COLOR_RED}not found. Installing $RESET$BG_RED fonts-jetbrains-mono $RESET${COLOR_RED} ...$RESET\n"

    sudo apt install -y fonts-jetbrains-mono
    
    echo -e "\n	$BG_GREEN fonts-jetbrains-mono $RESET$COLOR_GREEN installed$RESET\n"
  else
    echo -e "\n	$BG_GREEN fonts-jetbrains-mono $RESET ${COLOR_GREEN}already installed$RESET\n"
  fi

  # link_file "fonts-jetbrains-mono/.config/fonts-jetbrains-mono/config.ini" ".config/fonts-jetbrains-mono/config.ini"
}

uninstall_fonts_jetbrains_mono() {
  if command -v fonts-jetbrains-mono >/dev/null 2>&1; then

    echo -e "\n	${COLOR_RED}Purging $RESET$BG_RED fonts-jetbrains-mono $RESET \n"

    sudo apt purge -y fonts-jetbrains-mono
    sudo apt autoremove -y
    # rm -rf "$HOME/.config/fonts-jetbrains-mono"
  
    echo -e "\n	$BG_GREEN fonts-jetbrains-mono $RESET$COLOR_GREEN removed$RESET\n"

  else
    echo -e "\n	$BG_GREEN fonts-jetbrains-mono $RESET ${COLOR_GREEN}missing.$RESET\n"
  fi
}