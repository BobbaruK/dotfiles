#!/usr/bin/env bash

install_git() {
  if ! command -v git >/dev/null 2>&1; then
    echo -e "\n	$BG_RED git $RESET ${COLOR_RED}not found. Installing $RESET$BG_RED git $RESET${COLOR_RED} ...$RESET \n"

    sudo apt install -y git
    
    echo -e "\n	$BG_GREEN git $RESET$COLOR_GREEN installed$RESET\n"
  else
    echo -e "\n	$BG_GREEN git $RESET ${COLOR_GREEN}already installed$RESET\n"
  fi

  link_file "git/gitconfig" ".gitconfig"

}

uninstall_git() {
  if command -v git >/dev/null 2>&1; then

    echo -e "\n	${COLOR_RED}Purging $RESET$BG_RED git $RESET \n"

    sudo apt purge -y git
    sudo apt autoremove -y
    rm -f "$HOME/.gitconfig"
    rm -rf "$HOME/.config/git"
  
    echo -e "\n	$BG_GREEN git $RESET$COLOR_GREEN removed$RESET\n"

  else
    echo -e "\n	$BG_GREEN git $RESET ${COLOR_GREEN}missing.$RESET\n"
  fi
}