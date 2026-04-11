#!/usr/bin/env bash

install_polybar() {
  if ! command -v polybar >/dev/null 2>&1; then
    echo -e "\n	$BG_RED polybar $RESET ${COLOR_RED}not found. Installing $RESET$BG_RED polybar $RESET${COLOR_RED} ...$RESET \n"

    sudo apt install -y polybar

    mkdir -p ~/.config/polybar


    link_file "polybar/.config/polybar/launch.sh" ".config/polybar/launch.sh"

    chmod +x ~/.config/polybar/launch.sh
    
    echo -e "\n	$BG_GREEN polybar $RESET$COLOR_GREEN installed$RESET\n"
  else
    echo -e "\n	$BG_GREEN polybar $RESET ${COLOR_GREEN}already installed$RESET\n"
  fi

  link_file "polybar/.config/polybar/config.ini" ".config/polybar/config.ini"
  link_file "polybar/SymbolsNerdFont-Regular.ttf" ".fonts/SymbolsNerdFont-Regular.ttf"
  link_file "polybar/SymbolsNerdFontMono-Regular.ttf" ".fonts/SymbolsNerdFontMono-Regular.ttf"

  fc-cache -fv
}

uninstall_polybar() {
  if command -v polybar >/dev/null 2>&1; then

    echo -e "\n	${COLOR_RED}Purging $RESET$BG_RED polybar $RESET \n"

    sudo apt purge -y polybar
    sudo apt autoremove -y
    # rm -rf "$HOME/.config/polybar"
  
    echo -e "\n	$BG_GREEN polybar $RESET$COLOR_GREEN removed$RESET\n"

  else
    echo -e "\n	$BG_GREEN polybar $RESET ${COLOR_GREEN}missing.$RESET\n"
  fi
}