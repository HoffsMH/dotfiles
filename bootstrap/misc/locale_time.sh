#!/usr/bin/bash

set -e

source "./config.sh"

echo "###############################################"
echo "LOCALES TIME AND HOSTNAME"
echo "###############################################"

# set which locales are downloaded
sed -i '/en_US.UTF-8 UTF-8/c\en_US.UTF-8 UTF-8' /etc/locale.gen
sed -i '/en_US ISO-8859-1/c\en_US ISO-8859-1' /etc/locale.gen

#generate?
locale-gen

# Set locales
echo "LANG=en-US.UTF-8" >> /etc/locale.conf

# Timezones
ln -sf "/usr/share/zoneinfo/$TIMEZONE" /etc/localtime

echo $HOSTNAME > /etc/hostname
