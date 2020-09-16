#! /bin/bash

echo "###############################################"
echo "yubikey wiring"
echo "###############################################"

yay -S --noconfirm \
    yubikey-manager \
    yubikey-manager-qt \
    yubioath-desktop

sudo systemctl enable "pcscd.service"
sudo systemctl start "pcscd.service"

curl mhkr.io/key.pub | gpg --import
fpr=$(curl mhkr.io/key.pub | gpg --with-fingerprint --with-colons | grep fpr | cut -d ':' -f 10)

echo  "$fpr:6:" | gpg --homedir "$HOME/.gnupg" --import-ownertrust

gpg-connect-agent "scd serialno" "learn --force" /bye

pushd ~
  git clone git@mhkr.io:/srv/git/pass.git .password-store
popd
