#! /bin/bash

set -e

echo "###############################################"
echo "install watchdog"
echo "###############################################"

yay -S --noconfirm \
  watchdog

systemctl enable  watchdog.service || echo "enabling dunst failed"
systemctl start   watchdog.service || echo "starting dunst failed"
