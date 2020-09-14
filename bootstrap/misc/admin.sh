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

curl mhkr.io/key.pub | gpg --import
gpg --edit-key matthecker@pm.me
gpg-connect-agent "scd serialno" "learn --force" /bye

pushd ~
  git clone git@mhkr.io:/srv/git/pass.git .password-store
  git remote add origin git@mhkr.io:/srv/git/pass.git
popd

"$HOME/personal/dotfiles/bootstrap/misc/remove-cruft.sh"
