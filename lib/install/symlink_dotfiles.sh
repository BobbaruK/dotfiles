symlink_dotfiles() {
  link_file "profile/profile" ".profile"
  link_file "git/gitconfig" ".gitconfig"
  link_file "shell/zshrc" ".zshrc"
  link_file "shell/agnosterzak.zsh-theme" ".oh-my-zsh/themes/agnosterzak.zsh-theme"
  link_file "vscode/settings.json" ".config/Code/User/settings.json"
}