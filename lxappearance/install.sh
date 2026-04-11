#!/usr/bin/env bash

install_lxappearance() {
  if ! command -v lxappearance >/dev/null 2>&1; then
    echo -e "\n	$BG_RED lxappearance $RESET ${COLOR_RED}not found. Installing $RESET$BG_RED lxappearance $RESET${COLOR_RED} ...$RESET \n"

    sudo apt install -y lxappearance
    
    echo -e "\n	$BG_GREEN lxappearance $RESET$COLOR_GREEN installed$RESET\n"
  else
    echo -e "\n	$BG_GREEN lxappearance $RESET ${COLOR_GREEN}already installed$RESET\n"
  fi

  # link_file "lxappearance/.config/lxappearance/config" ".config/lxappearance/config"
}

uninstall_lxappearance() {
  if command -v lxappearance >/dev/null 2>&1; then

    echo -e "\n	${COLOR_RED}Purging $RESET$BG_RED lxappearance $RESET \n"

    sudo apt purge -y lxappearance
    sudo apt autoremove -y
    # rm -rf "$HOME/.config/lxappearance"
  
    echo -e "\n	$BG_GREEN lxappearance $RESET$COLOR_GREEN removed$RESET\n"

  else
    echo -e "\n	$BG_GREEN lxappearance $RESET ${COLOR_GREEN}missing.$RESET\n"
  fi
}