#!/usr/bin/bash

set -e

source "$HOME/code/util/bootstrap/config.sh"

echo "###############################################"
echo "MISC ADMIN"
echo "###############################################"

cp "$PERSONAL_DIR/dotfiles/linux/dlscript.sh" "$PERSONAL_DIR/media/dlscript.sh"

#speed up aur makepkg
sudo sed -i '/MAKEFLAGS=/c\MAKEFLAGS="-j$(nproc)"' /etc/makepkg.conf
sudo sed -i 's/^#\s*\(%wheel\s\+ALL=(ALL)\s\+NOPASSWD:\s\+ALL\)/\1/' /etc/sudoers

if [  -f /etc/sudoers.d/10-installer ]; then
  sudo sed -i 's/^\s*\(%wheel\s\+ALL=(ALL)\)\sALL/\1 NOPASSWD: ALL/' /etc/sudoers.d/10-installer
fi

sudo systemctl disable lightdm.service

# I dont want a greeter
sudo pacman -Rs --noconfirm lightdm light-locker lightdm-gtk-greeter lightdm-gtk-greeter-settings

sudo systemctl enable docker.service
sudo systemctl start docker.service

sudo systemctl enable "syncthing@$USERNAME.service"
sudo systemctl start "syncthing@$USERNAME.service"

chsh
