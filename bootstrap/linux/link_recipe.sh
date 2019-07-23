#! /bin/bash

set -e

echo "###############################################"
echo "LINUX LINKS"
echo "###############################################"

mkdir -p ~/.config/kitty
mkdir -p "$HOME/.config/lf"

mkdir -p ~/.config/conky
mkdir -p ~/.config/sxhkd
mkdir -p ~/.config/redshift

ln -sf ~/personal/dotfiles/linux/kitty.conf ~/.config/kitty/kitty.conf
ln -sf ~/personal/dotfiles/linux/.xinitrc ~/.xinitrc
ln -sf ~/personal/dotfiles/linux/.Xmodmap ~/.Xmodmap
ln -sf ~/personal/dotfiles/linux/.profile ~/.zprofile
ln -sf ~/personal/dotfiles/linux/.zshrc ~/.zshrc
ln -sf ~/personal/dotfiles/linux/.spacemacs ~/.spacemacs
ln -sf ~/personal/dotfiles/linux/conky.conf ~/.config/conky/conky.conf
ln -sf ~/personal/dotfiles/linux/redshift.conf ~/.config/redshift/
ln -sf ~/code/util/exenv ~/.exenv

# st3
ln -sf ~/personal/dotfiles/linux/Preferences.sublime-settings ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
ln -sf ~/personal/dotfiles/linux/Package\ Control.sublime-settings ~/.config/sublime-text-3/Packages/User/Package\ Control.sublime-settings
ln -sf ~/personal/dotfiles/linux/Default\ \(Linux\).sublime-keymap ~/.config/sublime-text-3/Packages/User/Default\ \(Linux\).sublime-keymap



ln -sf ~/personal/dotfiles/linux/lfrc ~/.config/lf/lfrc
ln -sf ~/personal/dotfiles/linux/sxhkdrc ~/.config/sxhkd/sxhkdrc
