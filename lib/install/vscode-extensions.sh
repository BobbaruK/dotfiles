install_vscode_extensions() {
  local file="$HOME/.dotfiles/vscode/extensions.txt"

  if ! command -v code >/dev/null 2>&1; then
    echo -e "\n	$BG_YELLOW VS Code $RESET$COLOR_YELLOW not installed${RESET}, skipping extensions\n"
    return
  fi

  if [ ! -f "$file" ]; then
    echo -e "\n	$BG_YELLOW extensions.txt $RESET not found at $COLOR_YELLOW$file$RESET\n"
    return
  fi

  echo -e "\n	Installing $BG_GREEN VS Code extensions $RESET ...\n"

  local installed
  installed=$(code --list-extensions)

  while IFS= read -r ext || [ -n "$ext" ]; do
    [[ -z "$ext" || "$ext" =~ ^# ]] && continue

    if echo "$installed" | grep -q "^$ext$"; then
      echo -e "		$BOLD$ext$RESET already installed \n"
    else
      echo -e "		Installing $BOLD$ext$RESET \n"
      code --install-extension "$ext"
    fi
  done < "$file"
}