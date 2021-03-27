#!/bin/bash

git clone https://aur.archlinux.org/yay.git ~/.cache/install-yay
cd ~/.cache/install-yay
makepkg -si --noconfirm
