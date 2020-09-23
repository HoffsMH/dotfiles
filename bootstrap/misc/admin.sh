#!/usr/bin/bash

set -e

echo "###############################################"
echo "MISC ADMIN"
echo "###############################################"

# make thunar our default gui file manager
xdg-mime  default  thunar.desktop inode/directory

if [  -f /etc/sudoers.d/10-installer ]; then
  sudo sed -i 's/^\s*\(%wheel\s\+ALL=(ALL)\)\sALL/\1 NOPASSWD: ALL/' /etc/sudoers.d/10-installer
fi

# get the time right
sudo ntpd -qg
sudo timedatectl set-timezone "$(curl --fail https://ipapi.co/timezone)"
sudo hwclock -w

"$HOME/personal/dotfiles/bootstrap/misc/remove-cruft.sh"

"$HOME/personal/dotfiles/bootstrap/install/yubikey-software.sh"
"$HOME/personal/dotfiles/bootstrap/install/yubikey-device.sh"

