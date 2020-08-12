
#! /bin/bash

set -e

echo "###############################################"
echo "EXTRA INSTALLS"
echo "###############################################"

yay -Syu
yay -S --noconfirm \
  phoronix-test-suite \
  discord \
  bspwm \
  soulseekqt \
  deluge-git \
  graphviz \
  filezilla \
  nmap \
  balena-etcher

