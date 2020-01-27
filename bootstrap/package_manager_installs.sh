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
echo "YAY BASIC RECIPE"
echo "###############################################"

yay -S --noconfirm \
    direnv \
    rbenv \
    nodenv \
    nodenv-node-build-git \
    slack-desktop \
    ranger \
    sublime-text-dev \
    google-chrome \
    deluge-git \
    otf-fira-code \
    ruby-build \
    python-grip \
    pcloud-drive \
    pmount \
    htop \
    soulseekqt \
    colorgrab \
    bcwc-pcie-git \
    bitwarden-bin \
    taskell \
    arandr \
    peek \
    libratbag \
    piper \
    inotify-tools \
    bfg \
    cronie \
    discord \
    gnome-calculator \
    lolcat

echo "###############################################"
echo "UNINSTALL BASIC RECIPE (remove cruft)"
echo "###############################################"

# I dont want a greeter
sudo systemctl disable lightdm.service
sudo pacman -Rs --noconfirm lightdm \
       light-locker \
       lightdm-gtk-greeter \
       lightdm-gtk-greeter-settings

echo "###############################################"
echo "install lanuguages and enable services"
echo "###############################################"

sudo systemctl enable docker.service
sudo systemctl start docker.service

sudo systemctl enable "syncthing@$USER.service"
sudo systemctl start "syncthing@$USER.service"

sudo systemctl enable "cpupower"
sudo systemctl start "cpupower"

# stable versions of everything as my default
rbenv install 2.7.0
exenv install 1.9.4
nodenv install 13.6.0

cd "$HOME"

rbenv local 2.7.0
exenv local 1.9.4
nodenv local 13.6.0

# install gcloud
curl https://sdk.cloud.google.com | bash

exec -l $SHELL
