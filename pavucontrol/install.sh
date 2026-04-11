#!/usr/bin/env bash

install_pavucontrol() {
  if ! command -v pavucontrol >/dev/null 2>&1; then
    echo -e "\n	$BG_RED pavucontrol $RESET ${COLOR_RED}not found. Installing $RESET$BG_RED pavucontrol $RESET${COLOR_RED} ...$RESET \n"

    sudo apt install -y pavucontrol
    
    echo -e "\n	$BG_GREEN pavucontrol $RESET$COLOR_GREEN installed$RESET\n"
  else
    echo -e "\n	$BG_GREEN pavucontrol $RESET ${COLOR_GREEN}already installed$RESET\n"
  fi

  # link_file "pavucontrol/.config/pavucontrol/config" ".config/pavucontrol/config"
}

uninstall_pavucontrol() {
  if command -v pavucontrol >/dev/null 2>&1; then

    echo -e "\n	${COLOR_RED}Purging $RESET$BG_RED pavucontrol $RESET \n"

    sudo apt purge -y pavucontrol
    sudo apt autoremove -y
    # rm -rf "$HOME/.config/pavucontrol"
  
    echo -e "\n	$BG_GREEN pavucontrol $RESET$COLOR_GREEN removed$RESET\n"

  else
    echo -e "\n	$BG_GREEN pavucontrol $RESET ${COLOR_GREEN}missing.$RESET\n"
  fi
}