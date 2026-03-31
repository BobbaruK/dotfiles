link_file() {
  local src="$DOTFILES_DIR/$1"
  local dest="$HOME/$2"
  local backup_path="$BACKUP_DIR/$2.backup.$(date +%s)"

  echo -e " Linking $BOLD$dest$RESET to -> $BOLD$src$RESET"

  if [ ! -e "$src" ]; then
    echo -e "   ${BG_RED} Source does not exist: ${UNDERLINE}$src$RESET"
    return 1
  fi

  if [ -L "$dest" ]; then
    echo -e "   ${COLOR_RED}Removing$RESET ${UNDERLINE}existing symlink$RESET..."
    rm "$dest"

  elif [ -e "$dest" ]; then
    echo -e "$+
    {BG_YELLOW} Backing up to $RESET $UNDERLINE$BOLD$backup_path$RESET"
    mkdir -p "$(dirname "$backup_path")"
    mv "$dest" "$backup_path"
  fi

  mkdir -p "$(dirname "$dest")"

  ln -s "$src" "$dest"

  echo -e "	${BG_GREEN} Symlink done. $RESET\n"
}