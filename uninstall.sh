#!/usr/bin/env bash
set -e

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

remove_docker() {
  echo -e "\n\t${COLOR_YELLOW} Purge ${BG_YELLOW} docker (desktop + engine) ${RESET}${COLOR_YELLOW} ... ${RESET}\n"

  # Stop Docker Desktop (user-level)
  systemctl --user stop docker-desktop 2>/dev/null || true
  systemctl --user disable docker-desktop 2>/dev/null || true

  # Stop Docker Engine (system-level)
  sudo systemctl stop docker 2>/dev/null || true
  sudo systemctl stop containerd 2>/dev/null || true

  echo -e "\tRemoving Docker Desktop package..."
  sudo apt purge -y docker-desktop 2>/dev/null || true

  echo -e "\tRemoving Docker Engine packages..."
  sudo apt purge -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin \
    docker-ce-rootless-extras 2>/dev/null || true

  sudo apt autoremove -y

  echo -e "\tRemoving Docker data (containers, images, volumes)..."

  sudo rm -rf /var/lib/docker
  sudo rm -rf /var/lib/containerd

  echo -e "\tRemoving user configs..."

  rm -rf "$HOME/.docker"
  rm -rf "$HOME/.config/docker-desktop"

  echo -e "\tRemoving Docker Desktop system files..."

  sudo rm -rf /opt/docker-desktop

  echo -e "\tRemoving Docker repository and key..."

  sudo rm -f /etc/apt/sources.list.d/docker.sources
  sudo rm -f /etc/apt/keyrings/docker.asc

  sudo apt update

  echo -e "\n\t${BG_GREEN} Docker fully removed ${RESET}\n"
}

echo -e "\n"

echo -e "${BG_MAGENTA} Full dev environment cleanup... ${RESET}"

echo -e "\n"

echo -e "	${COLOR_YELLOW} Remove ${BG_YELLOW} node ${RESET}${COLOR_YELLOW} and ${BG_YELLOW} nvm ${RESET}${COLOR_YELLOW} ... ${RESET}"

# Node + NVM
rm -rf "$HOME/.nvm"

echo -e "\n"

echo -e "	${COLOR_YELLOW} Purge and remove ${BG_YELLOW} zsh ${COLOR_YELLOW} and ${BG_YELLOW} oh my zsh ${RESET}${COLOR_YELLOW} ... ${RESET}"

echo -e "\n"

# Oh My Zsh
rm -rf "$HOME/.oh-my-zsh"

# ZSH
sudo chsh -s /bin/bash "$USER" || true
sudo apt purge -y zsh
rm -f "$HOME/.zshrc"
rm -f "$HOME/.shell.pre-oh-my-zsh"
rm -f "$HOME/.zsh_history"

echo -e "\n"

echo -e "	${COLOR_YELLOW} Purge ${BG_YELLOW} vscode ${RESET}${COLOR_YELLOW} ... ${RESET}"

echo -e "\n"

# VS Code
sudo apt purge -y code || true
sudo rm -f /etc/apt/sources.list.d/vscode.list
sudo rm -f /etc/apt/keyrings/packages.microsoft.gpg
sudo apt update
rm -rf "$HOME/.config/Code"
rm -rf "$HOME/.vscode"
sudo snap remove code
rm -rf "$HOME/snap/code"

echo -e "\n"

echo -e "	${COLOR_YELLOW} Purge ${BG_YELLOW} git ${RESET}${COLOR_YELLOW} ... ${RESET}"

echo -e "\n"

# Git
sudo apt purge -y git
sudo apt autoremove -y
rm -f "$HOME/.gitconfig"
rm -rf "$HOME/.config/git"

echo -e "\n"

echo -e "	${COLOR_YELLOW} Purge ${BG_YELLOW} curl ${RESET}${COLOR_YELLOW} ... ${RESET}"

echo -e "\n"

# Curl
sudo apt purge -y curl || true

echo -e "\n"

echo -e "	${COLOR_YELLOW} Purge and remove ${BG_YELLOW} docker ${RESET}${COLOR_YELLOW} ... ${RESET}"

echo -e "\n"

# Docker
remove_docker

echo -e "$BG_GREEN Cleanup done. Re-login recommended. $RESET"

echo -e "\n"

echo -e "Press ${BG_GREEN} Ctrl+C $RESET to ${UNDERLINE}abort${RESET}."

for i in {10..0}; do
echo -ne "\r${BG_RED} Executing pkill, killing all user processes $RESET ... $BG_RED $i $RESET"
  sleep 1
done

echo -e "\n"

pkill -KILL -u "$USER"
