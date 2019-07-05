#!/usr/bin/bash

set -e

source "$HOME/code/util/bootstrap/config.sh"

echo "###############################################"
echo "INSTALL GRUB"
echo "###############################################"

grub-install --target=$GRUB_TARGET /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
