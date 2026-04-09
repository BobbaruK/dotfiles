install_nvm() {
  if [ ! -d "$HOME/.nvm" ]; then
    echo -e "\n	$BG_RED nvm $RESET ${COLOR_RED}not found. Installing...$RESET\n"

    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

    echo -e "\n	$BG_GREEN nvm $RESET$COLOR_GREEN installed$RESET\n"
  else
    echo -e "\n	${BG_GREEN} nvm ${RESET} ${COLOR_GREEN}already installed$RESET\n"
  fi
}

install_nvm_and_node() {
  install_nvm

  install_node
}

uninstall_nvm_and_node() {
  echo -e "\n	${COLOR_RED}Removing $RESET$BG_RED nvm and node $RESET \n"

  rm -rf "$HOME/.nvm"
  
  echo -e "\n	$BG_GREEN nvm and node $RESET$COLOR_GREEN removed$RESET\n"
}