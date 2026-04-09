#!/usr/bin/env bash

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

uninstall_docker() {  
  if command -v docker >/dev/null 2>&1; then
    echo -e "\n\t${COLOR_GREEN} Purge ${BG_GREEN} docker (desktop + engine) ${RESET}${COLOR_GREEN} ... ${RESET}\n"

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

  else
    echo -e "\n	$BG_GREEN docker $RESET ${COLOR_GREEN}missing.$RESET\n"
  fi
}
