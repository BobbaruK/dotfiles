install_vscode() {
  if ! command -v code >/dev/null 2>&1; then
    echo -e "\n	$BG_RED vscode $RESET ${COLOR_RED}not found. Installing...$RESET\n"

    sudo apt install -y software-properties-common apt-transport-https wget gpg

    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg

    echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" \
      | sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null

    rm -f packages.microsoft.gpg

    sudo apt update
    sudo apt install -y code

    echo -e "\n	${BG_GREEN} VS Code $RESET ${COLOR_GREEN}installed$RESET\n"
  else
    echo -e "\n	${BG_GREEN} VS Code $RESET ${COLOR_GREEN}already installed$RESET\n"
  fi
}

install_vs_code_and_extensions() {
  install_vscode

  install_vscode_extensions
}

uninstall_vscode() {
  echo -e "\n	${COLOR_RED}Purging $RESET$BG_RED vscode $RESET \n"

  sudo apt purge -y code || true
  sudo rm -f /etc/apt/sources.list.d/vscode.list
  sudo rm -f /etc/apt/keyrings/packages.microsoft.gpg
  sudo apt update
  rm -rf "$HOME/.config/Code"
  rm -rf "$HOME/.vscode"
  sudo snap remove code
  rm -rf "$HOME/snap/code"

  echo -e "\n	$BG_GREEN vscode $RESET$COLOR_GREEN removed$RESET\n"
}

