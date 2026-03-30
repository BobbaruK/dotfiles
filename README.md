# Dotfiles

## Setup

### Auto

```bash
# Install
git clone <this-repo> ~/.dotfiles && bash ~/.dotfiles/install.sh

# Uninstall
bash ~/.dotfiles/uninstall.sh
```

### Manual

#### Install

```bash
# git
sudo apt install -y git
```

```bash
# curl
sudo apt install -y curl
```

[zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH#ubuntu-debian--derivatives-windows-10-wsl--native-linux-kernel-with-windows-10-build-1903)

```bash
# zsh
sudo apt install -y zsh
```

[oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh/wiki)

```bash
# oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

```bash
# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
```

```bash
# node latest lts
nvm install --lts
```

```bash
# default shell
sudo chsh -s "$(which zsh)" "$USER"
```

[vscode](https://code.visualstudio.com/docs/setup/linux)

[extensions](./vscode/extensions.txt)

```bash
# vscode extensions
code --install-extension <extension>
```

[docker](https://docs.docker.com/desktop/setup/install/linux/ubuntu/)

```bash
sudo apt update

sudo apt install gnome-terminal

# Add Docker's official GPG key:
sudo apt install ca-certificates
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF

sudo apt update

sudo apt install ./docker-desktop-amd64.deb
```

[agnosterzak-ohmyzsh-theme](https://github.com/zakaziko99/agnosterzak-ohmyzsh-theme)

```bash
# symlink dotfiles
ln -s ~/.dotfiles/profile/profile ~/.profile
ln -s ~/.dotfiles/git/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/shell/zshrc ~/.zshrc
ln -s ~/.dotfiles/shell/agnosterzak.zsh-theme ~/.oh-my-zsh/themes/agnosterzak.zsh-theme
ln -s ~/.dotfiles/vscode/settings.json ~/.config/Code/User/settings.json
```

#### Uninstall

```bash
# Node + NVM
rm -rf "$HOME/.nvm"
```

```bash
# Oh My Zsh
rm -rf "$HOME/.oh-my-zsh"
```

```bash
# ZSH
sudo chsh -s /bin/bash "$USER" || true
sudo apt purge -y zsh
rm -f "$HOME/.zshrc"
rm -f "$HOME/.shell.pre-oh-my-zsh"
rm -f "$HOME/.zsh_history"
```

```bash
# VS Code
sudo apt purge -y code || true
sudo rm -f /etc/apt/sources.list.d/vscode.list
sudo rm -f /etc/apt/keyrings/packages.microsoft.gpg
sudo apt update
rm -rf "$HOME/.config/Code"
rm -rf "$HOME/.vscode"
sudo snap remove code
rm -rf "$HOME/snap/code"
```

```bash
# Git
sudo apt purge -y git
sudo apt autoremove -y
rm -f "$HOME/.gitconfig"
rm -rf "$HOME/.config/git"
```

```bash
# Curl
sudo apt purge -y curl || true
```

```bash
  # Docker
  # Stop Docker Desktop (user-level)
  systemctl --user stop docker-desktop 2>/dev/null || true
  systemctl --user disable docker-desktop 2>/dev/null || true

  # Stop Docker Engine (system-level)
  sudo systemctl stop docker 2>/dev/null || true
  sudo systemctl stop containerd 2>/dev/null || true

  sudo apt purge -y docker-desktop 2>/dev/null || true

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

  rm -rf "$HOME/.docker"
  rm -rf "$HOME/.config/docker-desktop"

  sudo rm -rf /opt/docker-desktop

  sudo rm -f /etc/apt/sources.list.d/docker.sources
  sudo rm -f /etc/apt/keyrings/docker.asc

  sudo apt update
```
