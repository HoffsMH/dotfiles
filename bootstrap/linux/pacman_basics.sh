#! /bin/bash

set -e


echo "###############################################"
echo "PACMAN BASIC RECIPE"
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
       elixir \
       kitty \
       fzf \
       evtest \
       xcape \
       xorg-fonts-misc \
       xorg-font-util \
       xorg-fonts-alias \
       xorg-fonts-encodings \
       xorg-xev \
       jdk-openjdk \
       clipmenu \
       clipnotify \
       i3-gaps \
       i3status \
       ttf-fira-code \
       mpg123 \
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
       gwenview
