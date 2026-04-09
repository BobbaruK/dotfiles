install_curl() {
  if ! command -v curl >/dev/null 2>&1; then
    echo -e "\n	$BG_RED curl $RESET ${COLOR_RED}not found. Installing $RESET$BG_RED $pkg $RESET${COLOR_RED} ...$RESET\n"

    sudo apt install -y curl
    
    echo -e "\n	$BG_GREEN curl $RESET$COLOR_GREEN installed$RESET\n"

  else
    echo -e "\n	$BG_GREEN curl $RESET ${COLOR_GREEN}already installed$RESET\n"
  fi
}

uninstall_curl() {
  if command -v curl >/dev/null 2>&1; then

    echo -e "\n	${COLOR_RED}Purging $RESET$BG_RED curl $RESET \n"

    sudo apt purge -y curl || true
    
    echo -e "\n	$BG_GREEN curl $RESET$COLOR_GREEN removed$RESET\n"

  else
    echo -e "\n	$BG_GREEN curl $RESET ${COLOR_GREEN}missing.$RESET\n"
  fi
}