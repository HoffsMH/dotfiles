#!/usr/bin/env bash

source "./config.sh"

echo "###############################################"
echo "RUNNING PACSCTRAP"
echo "###############################################"

pacstrap /mnt \
         base \
         base-devel \
         $GRAPHICS_DRIVER \
         vim \
         emacs \
         git \
         xorg-server \
         xorg-xinit

genfstab -U /mnt >> /mnt/etc/fstab
