set_default_shell() {
  if [ "$SHELL" != "$(which zsh)" ]; then
    echo -e "\n	Switching default shell to ${BG_GREEN} zsh ${RESET} ...\n"
    sudo chsh -s "$(which zsh)" "$USER"
  else
    echo -e "\n	$BG_GREEN zsh $RESET ${COLOR_GREEN}already default shell$RESET\n"
  fi
}