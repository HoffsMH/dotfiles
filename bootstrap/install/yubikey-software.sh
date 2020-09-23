#! /bin/bash

echo "###############################################"
echo "yubikey software"
echo "###############################################"

yay -S --noconfirm \
    yubikey-manager \
    yubikey-manager-qt \
    yubioath-desktop

sudo systemctl enable "pcscd.service"
sudo systemctl start "pcscd.service"

