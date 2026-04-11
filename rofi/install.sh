#!/usr/bin/env bash

install_rofi() {
  if ! command -v rofi >/dev/null 2>&1; then
    echo -e "\n	$BG_RED rofi $RESET ${COLOR_RED}not found. Installing $RESET$BG_RED rofi $RESET${COLOR_RED} ...$RESET \n"

    sudo apt install -y rofi
    

    echo -e "\n	$BG_GREEN rofi $RESET$COLOR_GREEN installed$RESET\n"
  else
    echo -e "\n	$BG_GREEN rofi $RESET ${COLOR_GREEN}already installed$RESET\n"
  fi



  link_file "rofi/.config/rofi/scripts/powermenu.sh" ".config/rofi/scripts/powermenu.sh"
  link_file "rofi/.config/rofi/nord.rasi" ".config/rofi/nord.rasi"

  chmod +x ~/.config/rofi/scripts/powermenu.sh

}

uninstall_rofi() {
  if command -v rofi >/dev/null 2>&1; then

    echo -e "\n	${COLOR_RED}Purging $RESET$BG_RED rofi $RESET \n"

    sudo apt purge -y rofi
    sudo apt autoremove -y
    rm -rf "$HOME/.config/rofi"
  
    echo -e "\n	$BG_GREEN rofi $RESET$COLOR_GREEN removed$RESET\n"

  else
    echo -e "\n	$BG_GREEN rofi $RESET ${COLOR_GREEN}missing.$RESET\n"
  fi
}