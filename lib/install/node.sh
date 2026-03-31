install_node() {
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

  if ! command -v node >/dev/null 2>&1; then
    echo -e "\n	$BG_RED node $RESET ${COLOR_RED}not found. Installing via nvm...$RESET\n"

    nvm install --lts
    nvm alias default 'lts/*'

    echo -e "\n	$BG_GREEN Node (LTS) $RESET$COLOR_GREEN installed$RESET\n"
  else
    echo -e "\n	$BG_GREEN node $RESET ${COLOR_GREEN}already installed$RESET\n"
  fi
}