#!/usr/bin/env bash

set -e

DOTFILES_DIR="$HOME/.dotfiles"
BACKUP_DIR="$DOTFILES_DIR/backups"

BG_GREEN="\033[0;30;42;1m"
COLOR_GREEN="\033[0;32m"

BG_MAGENTA="\033[0;30;45;1m"
COLOR_MAGENTA="\033[0;35m"

BG_RED="\033[0;41;37;1m"
COLOR_RED="\033[0;31m"

BG_BLUE="\033[0;37;44;1m"
COLOR_BLUE="\033[0;34m"

BG_YELLOW="\033[0;30;43;1m"
COLOR_YELLOW="\033[0;33m"

BG_CYAN="\033[0;30;46;1m"
COLOR_CYAN="\033[0;36m"

BOLD="\033[1m"
UNDERLINE="\033[4m"

RESET="\033[0m"

install_if_missing() {
  local cmd="$1"
  local pkg="$2"

  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo -e "\n	$BG_RED $cmd $RESET ${COLOR_RED}not found. Installing $RESET$BG_RED $pkg $RESET${COLOR_RED} ...$RESET\n"
    sudo apt install -y "$pkg"
    # echo -e "\n"
  else
    echo -e "\n	$BG_GREEN $cmd $RESET ${COLOR_GREEN}already installed$RESET\n"
  fi
}

link_file() {
  local src="$DOTFILES_DIR/$1"
  local dest="$HOME/$2"
  local backup_path="$BACKUP_DIR/$2.backup.$(date +%s)"

  echo -e "Linking $BOLD$dest$RESET to -> $BOLD$src$RESET"

  if [ ! -e "$src" ]; then
    echo -e "${BG_RED} Source does not exist: ${UNDERLINE}$src$RESET"
    return 1
  fi

  if [ -L "$dest" ]; then
    echo -e "${COLOR_RED}Removing$RESET ${UNDERLINE}existing symlink$RESET..."
    rm "$dest"

  elif [ -e "$dest" ]; then
    echo -e "${BG_YELLOW} Backing up to $RESET $UNDERLINE$BOLD$backup_path$RESET"
    mkdir -p "$(dirname "$backup_path")"
    mv "$dest" "$backup_path"
  fi

  mkdir -p "$(dirname "$dest")"

  ln -s "$src" "$dest"

  echo -e "	${BG_GREEN} Symlink done. $RESET\n"

  # echo -e "\n"
}

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

install_nvm() {
  if [ ! -d "$HOME/.nvm" ]; then
    echo -e "\n	$BG_RED nvm $RESET ${COLOR_RED}not found. Installing...$RESET\n"

    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

    echo -e "\n	${COLOR_GREEN}nvm installed$RESET\n"
  else
    echo -e "\n	${BG_GREEN} nvm ${RESET} ${COLOR_GREEN}already installed$RESET\n"
  fi
}

install_node() {
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

  if ! command -v node >/dev/null 2>&1; then
    echo -e "\n	$BG_RED node $RESET ${COLOR_RED}not found. Installing via nvm...$RESET\n"

    nvm install --lts
    nvm alias default 'lts/*'

    echo -e "\n	${COLOR_GREEN}Node installed (LTS)$RESET\n"
  else
    echo -e "\n	$BG_GREEN node $RESET ${COLOR_GREEN}already installed$RESET\n"
  fi
}

set_default_shell() {
  if [ "$SHELL" != "$(which zsh)" ]; then
    echo -e "\n	Switching default shell to ${BG_GREEN} zsh ${RESET} ...\n"
    sudo chsh -s "$(which zsh)" "$USER"
  else
    echo -e "\n	$BG_GREEN zsh $RESET ${COLOR_GREEN}already default shell$RESET\n"
  fi
}

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
      echo -e "		$BOLD$ext$RESET already installed"
    else
      echo -e "		Installing $BOLD$ext$RESET"
      code --install-extension "$ext"
    fi
  done < "$file"
}

install_docker_desktop() {
  if command -v docker >/dev/null 2>&1; then
    echo -e "\n\t${BG_GREEN} docker ${RESET} ${COLOR_GREEN}already installed${RESET}\n"
    return
  fi

  echo -e "\n\t${BG_RED} docker ${RESET} ${COLOR_RED}not found. Installing...${RESET}\n"

  sudo apt update
  sudo apt install -y ca-certificates curl gnome-terminal

  # Keyring
  sudo install -m 0755 -d /etc/apt/keyrings

  if [ ! -f /etc/apt/keyrings/docker.asc ]; then
    echo -e "\tAdding Docker GPG key..."
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
      -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc
  fi

  # Repo
  echo -e "\tAdding Docker repository..."

  echo \
"Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc" \
  | sudo tee /etc/apt/sources.list.d/docker.sources > /dev/null

  sudo apt update

  # Download Docker Desktop .deb
  TMP_DEB="/tmp/docker-desktop.deb"

  echo -e "\tDownloading Docker Desktop..."

  curl -L "https://desktop.docker.com/linux/main/amd64/docker-desktop-amd64.deb" \
    -o "$TMP_DEB"

  echo -e "\tInstalling Docker Desktop..."

  sudo apt install -y "$TMP_DEB"

  rm -f "$TMP_DEB"

  echo -e "\n\t${BG_GREEN} Docker Desktop ${RESET} ${COLOR_GREEN}installed${RESET}\n"
}

echo -e "\n"

echo -e "${BG_MAGENTA} Checking dependencies... ${RESET}"

echo -e "\n"

sudo apt update

# echo -e "\n"

install_if_missing "git" "git"
install_if_missing "curl" "curl"
install_if_missing "zsh" "zsh"

install_oh_my_zsh
install_nvm
install_node
set_default_shell
install_vscode
install_vscode_extensions
install_docker_desktop
# TODO: install brave

echo -e "\n"

echo -e "${BG_BLUE} Setting up dotfiles... $RESET"

echo -e "\n"

mkdir -p "$BACKUP_DIR"

link_file "profile/profile" ".profile"
link_file "git/gitconfig" ".gitconfig"
link_file "shell/zshrc" ".zshrc"
link_file "shell/agnosterzak.zsh-theme" ".oh-my-zsh/themes/agnosterzak.zsh-theme"
link_file "vscode/settings.json" ".config/Code/User/settings.json"

echo -e "\n"

echo -e "${BG_GREEN} Finished! $RESET"

echo -e "\n"

echo -e "Press ${BG_GREEN} Ctrl+C $RESET to ${UNDERLINE}abort${RESET}."

for i in {10..0}; do
echo -ne "\r${BG_RED} Executing pkill, killing all user processes $RESET ... $BG_RED $i $RESET"
  sleep 1
done

echo -e "\n"

pkill -KILL -u "$USER"
