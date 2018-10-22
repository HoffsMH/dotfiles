#!/usr/bin/bash

# wifi-menu
# timedatectl set-ntp true
# lsblk
# fdisk
# mkfs.ext4 /dev/sda1 ..
# mkswap /dev/sda2
# swapon /dev/sda2

# 200M for boot
# 1.5x ram for swap
# 50G  for /mnt
# rest for home

# mount /dev/sda3 /mnt
# mount /dev/sda1 /mnt/root
# mount /dev/sda4 /mnt/boot
# mount /dev/sda2 /mnt/home

set -e

source "./config.sh"

./pacman_basics.sh

./useradd.sh

./install_grub.sh

./locale_time.sh

./misc_admin.sh

passwd

echo "###############################################"
echo "REBOOT TIME"
echo "###############################################"
