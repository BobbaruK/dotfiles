#!/usr/bin/env bash

install_arandr() {
  if ! command -v arandr >/dev/null 2>&1; then
    echo -e "\n	$BG_RED arandr $RESET ${COLOR_RED}not found. Installing $RESET$BG_RED arandr $RESET${COLOR_RED} ...$RESET\n"

    sudo apt install -y arandr
    ``
    echo -e "\n	$BG_GREEN arandr $RESET$COLOR_GREEN installed$RESET\n"
  else
    echo -e "\n	$BG_GREEN arandr $RESET ${COLOR_GREEN}already installed$RESET\n"
  fi

  # link_file "i3/.config/arandr/config" ".config/arandr/config"
}

uninstall_arandr() {
  if command -v arandr >/dev/null 2>&1; then

    echo -e "\n	${COLOR_RED}Purging $RESET$BG_RED arandr $RESET \n"

    sudo apt purge -y arandr
    sudo apt autoremove -y
    # rm -rf "$HOME/.config/arandr"
  
    echo -e "\n	$BG_GREEN arandr $RESET$COLOR_GREEN removed$RESET\n"

  else
    echo -e "\n	$BG_GREEN arandr $RESET ${COLOR_GREEN}missing.$RESET\n"
  fi
}