install_i3_core() {
  sudo apt install -y i3 i3status i3lock dmenu xorg
}

install_i3_utils() {
  sudo apt install -y alacritty feh picom network-manager-gnome
}

install_polybar() {
  # Install Polybar
  sudo apt install -y polybar

  # Create config directory
  mkdir -p ~/.config/polybar

  # Create launch script
  cat > ~/.config/polybar/launch.sh << 'EOF'
#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar
polybar main 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."
EOF

  chmod +x ~/.config/polybar/launch.sh


  link_file "i3/.config/polybar/config.ini" ".config/polybar/config.ini"
}

install_i3_extras() {
  sudo apt install -y rofi  lxappearance flameshot pavucontrol dunst brightnessctl thunar

  # Install popular themes
  sudo apt install -y arc-theme papirus-icon-theme

  # Install fonts
  sudo apt install -y fonts-jetbrains-mono fonts-font-awesome

  # install_polybar
    
  link_file "i3/.config/i3/config" ".config/i3/config"
  link_file "i3/.config/gtk-3.0/settings.ini" ".config/gtk-3.0/settings.ini"
  link_file "i3/.config/i3status/config" ".config/i3status/config"
  link_file "i3/.config/rofi/scripts/powermenu.sh" ".config/rofi/scripts/powermenu.sh"
  chmod +x ~/.config/rofi/scripts/powermenu.shp
}



