#!/usr/bin/env bash

install_zsh() {
  if ! command -v zsh >/dev/null 2>&1; then
    echo -e "\n	$BG_RED zsh $RESET ${COLOR_RED}not found. Installing $RESET$BG_RED $pkg $RESET${COLOR_RED} ...$RESET\n"

    sudo apt install -y zsh

    echo -e "\n	$BG_GREEN zsh $RESET$COLOR_GREEN installed$RESET\n"
  else
    echo -e "\n	$BG_GREEN zsh $RESET ${COLOR_GREEN}already installed$RESET\n"
  fi

  link_file "zsh/zshrc" ".zshrc"

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

install_oh_my_zsh() {
  if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo -e "\n	$BG_RED oh-my-zsh $RESET ${COLOR_RED}not found. Installing...$RESET\n"

    RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
      sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    link_file "zsh/agnosterzak.zsh-theme" ".oh-my-zsh/themes/agnosterzak.zsh-theme"

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