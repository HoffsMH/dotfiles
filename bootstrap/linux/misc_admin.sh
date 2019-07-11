#!/usr/bin/bash

set -e


echo "###############################################"
echo "MISC ADMIN"
echo "###############################################"

cp "$HOME/personal/dotfiles/linux/dlscript.sh" "$HOME/bin/ytgo"

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

sudo systemctl enable "syncthing@$USER.service"
sudo systemctl start "syncthing@$USER.service"

chsh
