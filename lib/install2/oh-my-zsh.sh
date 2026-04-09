install_oh_my_zsh() {
  if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo -e "\n	$BG_RED oh-my-zsh $RESET ${COLOR_RED}not found. Installing...$RESET\n"

    RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
      sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    echo -e "\n	$BG_GREEN oh-my-zsh $RESET $COLOR_GREEN installed$RESET\n"
  else
    echo -e "\n	$BG_GREEN oh-my-zsh $RESET$COLOR_GREEN already installed$RESET\n"
  fi
}

uninstall_oh_my_zsh() {
  echo -e "\n	${COLOR_RED}Removing $RESET$BG_RED oh-my-zsh $RESET \n"

  rm -rf "$HOME/.oh-my-zsh"

  echo -e "\n	$BG_GREEN oh-my-zsh $RESET$COLOR_GREEN removed$RESET\n"
}