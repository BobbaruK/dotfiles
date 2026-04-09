install_libreoffice() {
  if ! command -v libreoffice >/dev/null 2>&1; then
    echo -e "\n	$BG_RED LibreOffice $RESET ${COLOR_RED}not found. Installing $RESET$BG_RED $pkg $RESET${COLOR_RED} ...$RESET\n"

    sudo apt install libreoffice -y
    
    echo -e "\n	$BG_GREEN LibreOffice $RESET$COLOR_GREEN installed$RESET\n"
  else
    echo -e "\n	$BG_GREEN LibreOffice $RESET ${COLOR_GREEN}already installed$RESET\n"
  fi
}

uninstall_libreoffice() {
  if command -v libreoffice >/dev/null 2>&1; then

    echo -e "\n	${COLOR_RED}Purging $RESET$BG_RED LibreOffice $RESET \n"

    sudo apt-get remove --purge "libreoffice*" -y
    sudo apt-get clean
    sudo apt-get autoremove -y
  
    echo -e "\n	$BG_GREEN LibreOffice $RESET$COLOR_GREEN removed$RESET\n"

  else
    echo -e "\n	$BG_GREEN LibreOffice $RESET ${COLOR_GREEN}missing.$RESET\n"
  fi
}