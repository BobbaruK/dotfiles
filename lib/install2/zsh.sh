# source "$HOME/.dotfiles/lib/core/utils/set-default-shell.sh"

install_zsh() {
  if ! command -v zsh >/dev/null 2>&1; then
    echo -e "\n	$BG_RED zsh $RESET ${COLOR_RED}not found. Installing $RESET$BG_RED $pkg $RESET${COLOR_RED} ...$RESET\n"

    sudo apt install -y zsh

    echo -e "\n	$BG_GREEN zsh $RESET$COLOR_GREEN installed$RESET\n"
  else
    echo -e "\n	$BG_GREEN zsh $RESET ${COLOR_GREEN}already installed$RESET\n"
  fi

  set_default_shell
}

uninstall_zsh() {
  if command -v zsh >/dev/null 2>&1; then

    echo -e "\n	${COLOR_RED}Purging $RESET$BG_RED zsh $RESET \n"

    sudo chsh -s /bin/bash "$USER" || true
    sudo apt purge -y zsh
    rm -f "$HOME/.zshrc"
    rm -f "$HOME/.shell.pre-oh-my-zsh"
    rm -f "$HOME/.zsh_history"
    
    echo -e "\n	$BG_GREEN zsh $RESET$COLOR_GREEN removed$RESET\n"

  else
    echo -e "\n	$BG_GREEN zsh $RESET ${COLOR_GREEN}missing.$RESET\n"
  fi
}