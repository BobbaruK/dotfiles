#!/usr/bin/env bash

install_i3lock() {
  if ! command -v i3lock >/dev/null 2>&1; then
    echo -e "\n	$BG_RED i3lock $RESET ${COLOR_RED}not found. Installing $RESET$BG_RED i3lock $RESET${COLOR_RED} ...$RESET\n"

    sudo apt install -y i3lock
    
    echo -e "\n	$BG_GREEN i3lock $RESET$COLOR_GREEN installed$RESET\n"
  else
    echo -e "\n	$BG_GREEN i3lock $RESET ${COLOR_GREEN}already installed$RESET\n"
  fi

  # link_file "i3/.config/i3lock/config" ".config/i3lock/config"
}

uninstall_i3lock() {
  if command -v i3lock >/dev/null 2>&1; then

    echo -e "\n	${COLOR_RED}Purging $RESET$BG_RED i3lock $RESET \n"

    sudo apt purge -y i3lock
    sudo apt autoremove -y
    # rm -rf "$HOME/.config/i3lock"
  
    echo -e "\n	$BG_GREEN i3lock $RESET$COLOR_GREEN removed$RESET\n"

  else
    echo -e "\n	$BG_GREEN i3lock $RESET ${COLOR_GREEN}missing.$RESET\n"
  fi
}