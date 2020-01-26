#! /bin/bash

set -e


echo "###############################################"
echo "PACMAN INSTALL BASIC RECIPE"
echo "###############################################"

sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm \
       pulsemixer \
       gnutls \
       vim \
       fzf \
       fasd \
       exa \
       jq \
       emacs \
       xclip \
       xorg-xclipboard \
       xorg-xsetroot \
       conky-cli \
       feh \
       firefox \
       tree \
       docker \
       docker-compose \
       neofetch \
       openssh \
       sudo \
       networkmanager \
       mpv \
       light \
       sxhkd \
       scrot \
       grub \
       figlet \
       zsh \
       the_silver_searcher \
       ttf-linux-libertine \
       ttf-inconsolata \
       erlang \
       elixir \
       kitty \
       fzf \
       evtest \
       xcape \
       noto-fonts \
       noto-fonts-cjk \
       noto-fonts-emoji \
       xorg-fonts-misc \
       xorg-font-util \
       xorg-fonts-alias \
       xorg-fonts-encodings \
       xorg-xev \
       jdk-openjdk \
       clipmenu \
       clipnotify \
       ntfs-3g \
       poppler \
       redshift \
       axel \
       syncthing \
       zathura \
       zathura-pdf-poppler \
       flameshot \
       seahorse \
       entr \
       blueman \
       pyenv \
       filezilla \
       st \
       zeal \
       restic \
       gwenview \
       xorg-xfontsel \
       xdotool


echo "###############################################"
echo "PACMAN UNINSTALL BASIC RECIPE (remove cruft)"
echo "###############################################"

# I dont want a greeter
sudo systemctl disable lightdm.service
sudo pacman -Rs --noconfirm lightdm \
       light-locker \
       lightdm-gtk-greeter \
       lightdm-gtk-greeter-settings
