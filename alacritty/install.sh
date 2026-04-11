#!/usr/bin/env bash

install_alacritty() {
  if ! command -v alacritty >/dev/null 2>&1; then
    echo -e "\n	$BG_RED alacritty $RESET ${COLOR_RED}not found. Installing $RESET$BG_RED alacritty $RESET${COLOR_RED} ...$RESET \n"

    sudo apt install -y alacritty
    ``
    echo -e "\n	$BG_GREEN alacritty $RESET$COLOR_GREEN installed$RESET\n"
  else
    echo -e "\n	$BG_GREEN alacritty $RESET ${COLOR_GREEN}already installed$RESET\n"
  fi

  # link_file "i3/.config/alacritty/config" ".config/alacritty/config"
}

uninstall_alacritty() {
  if command -v alacritty >/dev/null 2>&1; then

    echo -e "\n	${COLOR_RED}Purging $RESET$BG_RED alacritty $RESET \n"

    sudo apt purge -y alacritty
    sudo apt autoremove -y
    # rm -rf "$HOME/.config/alacritty"
  
    echo -e "\n	$BG_GREEN alacritty $RESET$COLOR_GREEN removed$RESET\n"

  else
    echo -e "\n	$BG_GREEN alacritty $RESET ${COLOR_GREEN}missing.$RESET\n"
  fi
}