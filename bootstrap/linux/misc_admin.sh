#!/usr/bin/bash

set -e


echo "###############################################"
echo "MISC ADMIN"
echo "###############################################"

cp -f "$HOME/personal/dotfiles/linux/dlscript.sh" "$HOME/bin/ytgo"

# cp  ~/personal/dotfiles/common/.envrc.sample ~/.envrc

#speed up aur makepkg
sudo sed -i '/MAKEFLAGS=/c\MAKEFLAGS="-j$(nproc)"' /etc/makepkg.conf
sudo sed -i 's/^#\s*\(%wheel\s\+ALL=(ALL)\s\+NOPASSWD:\s\+ALL\)/\1/' /etc/sudoers


if [  -f /etc/sudoers.d/10-installer ]; then
  sudo sed -i 's/^\s*\(%wheel\s\+ALL=(ALL)\)\sALL/\1 NOPASSWD: ALL/' /etc/sudoers.d/10-installer
fi


# get the time right
sudo ntpd -qg
sudo timedatectl set-timezone "$(curl --fail https://ipapi.co/timezone)"
sudo hwclock -w


sudo systemctl enable docker.service
sudo systemctl start docker.service

sudo systemctl enable "syncthing@$USER.service"
sudo systemctl start "syncthing@$USER.service"

sudo systemctl enable "cpupower"
sudo systemctl start "cpupower"

./setup_restic.sh


sudo mkdir -p /usr/local/opt/zlib/lib
rbenv install 2.7.0
exenv install 1.9.4
nodenv install 13.6.0

cd

rbenv local 2.7.0
exenv local 1.9.4
nodenv local 13.6.0

