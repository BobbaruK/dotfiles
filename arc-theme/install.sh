#!/usr/bin/env bash

install_arc_theme() {
  if ! command -v arc-theme >/dev/null 2>&1; then
    echo -e "\n	$BG_RED arc-theme $RESET ${COLOR_RED}not found. Installing $RESET$BG_RED arc-theme $RESET${COLOR_RED} ...$RESET\n"

    sudo apt install -y arc-theme
    
    echo -e "\n	$BG_GREEN arc-theme $RESET$COLOR_GREEN installed$RESET\n"
  else
    echo -e "\n	$BG_GREEN arc-theme $RESET ${COLOR_GREEN}already installed$RESET\n"
  fi

  # link_file "arc-theme/.config/arc-theme/config.ini" ".config/arc-theme/config.ini"
}

uninstall_arc_theme() {
  if command -v arc-theme >/dev/null 2>&1; then

    echo -e "\n	${COLOR_RED}Purging $RESET$BG_RED arc-theme $RESET \n"

    sudo apt purge -y arc-theme
    sudo apt autoremove -y
    # rm -rf "$HOME/.config/arc-theme"
  
    echo -e "\n	$BG_GREEN arc-theme $RESET$COLOR_GREEN removed$RESET\n"

  else
    echo -e "\n	$BG_GREEN arc-theme $RESET ${COLOR_GREEN}missing.$RESET\n"
  fi
}