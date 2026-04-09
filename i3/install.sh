#!/usr/bin/env bash

install_i3() {
  if ! command -v i3 >/dev/null 2>&1; then
    echo -e "\n	$BG_RED i3 $RESET ${COLOR_RED}not found. Installing $RESET$BG_RED i3 $RESET${COLOR_RED} ...$RESET\n"

    sudo apt install -y i3 xorg
    
    echo -e "\n	$BG_GREEN i3 $RESET$COLOR_GREEN installed$RESET\n"
  else
    echo -e "\n	$BG_GREEN i3 $RESET ${COLOR_GREEN}already installed$RESET\n"
  fi

  link_file "i3/.config/i3/config" ".config/i3/config"
}

uninstall_i3() {
  if command -v i3 >/dev/null 2>&1; then

    echo -e "\n	${COLOR_RED}Purging $RESET$BG_RED i3 $RESET \n"

    sudo apt purge -y i3
    sudo apt autoremove -y
    rm -rf "$HOME/.config/i3"
  
    echo -e "\n	$BG_GREEN i3 $RESET$COLOR_GREEN removed$RESET\n"

  else
    echo -e "\n	$BG_GREEN i3 $RESET ${COLOR_GREEN}missing.$RESET\n"
  fi
}