#!/usr/bin/env bash

install_dunst() {
  if ! command -v dunst >/dev/null 2>&1; then
    echo -e "\n	$BG_RED dunst $RESET ${COLOR_RED}not found. Installing $RESET$BG_RED dunst $RESET${COLOR_RED} ...$RESET \n"

    sudo apt install -y dunst
    
    echo -e "\n	$BG_GREEN dunst $RESET$COLOR_GREEN installed$RESET\n"
  else
    echo -e "\n	$BG_GREEN dunst $RESET ${COLOR_GREEN}already installed$RESET\n"
  fi

  link_file "dunst/.config/dunst/dunstrc" ".config/dunst/dunstrc"
}

uninstall_dunst() {
  if command -v dunst >/dev/null 2>&1; then

    echo -e "\n	${COLOR_RED}Purging $RESET$BG_RED dunst $RESET \n"

    sudo apt purge -y dunst
    sudo apt autoremove -y
    # rm -rf "$HOME/.config/dunst"
  
    echo -e "\n	$BG_GREEN dunst $RESET$COLOR_GREEN removed$RESET\n"

  else
    echo -e "\n	$BG_GREEN dunst $RESET ${COLOR_GREEN}missing.$RESET\n"
  fi
}