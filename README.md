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

```bash
# vscode
# https://code.visualstudio.com/docs/setup/linux
```

[extensions](./vscode/extensions.txt)

```bash
# vscode extensions
code --install-extension <extension>
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
