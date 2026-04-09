#!/usr/bin/env bash

install_papirus_icon_theme() {
  if ! command -v papirus-icon-theme >/dev/null 2>&1; then
    echo -e "\n	$BG_RED papirus-icon-theme $RESET ${COLOR_RED}not found. Installing $RESET$BG_RED papirus-icon-theme $RESET${COLOR_RED} ...$RESET\n"

    sudo apt install -y papirus-icon-theme
    
    echo -e "\n	$BG_GREEN papirus-icon-theme $RESET$COLOR_GREEN installed$RESET\n"
  else
    echo -e "\n	$BG_GREEN papirus-icon-theme $RESET ${COLOR_GREEN}already installed$RESET\n"
  fi

  # link_file "papirus-icon-theme/.config/papirus-icon-theme/config.ini" ".config/papirus-icon-theme/config.ini"
}

uninstall_papirus_icon_theme() {
  if command -v papirus-icon-theme >/dev/null 2>&1; then

    echo -e "\n	${COLOR_RED}Purging $RESET$BG_RED papirus-icon-theme $RESET \n"

    sudo apt purge -y papirus-icon-theme
    sudo apt autoremove -y
    # rm -rf "$HOME/.config/papirus-icon-theme"
  
    echo -e "\n	$BG_GREEN papirus-icon-theme $RESET$COLOR_GREEN removed$RESET\n"

  else
    echo -e "\n	$BG_GREEN papirus-icon-theme $RESET ${COLOR_GREEN}missing.$RESET\n"
  fi
}