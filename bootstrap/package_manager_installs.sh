#! /bin/bash

set -e


#speed up aur makepkg
sudo sed -i '/MAKEFLAGS=/c\MAKEFLAGS="-j$(nproc)"' /etc/makepkg.conf
sudo sed -i 's/^#\s*\(%wheel\s\+ALL=(ALL)\s\+NOPASSWD:\s\+ALL\)/\1/' /etc/sudoers


echo "###############################################"
echo "YAY BASIC RECIPE"
echo "###############################################"

sudo pacman -Syu
yay -Syu
yay -S --noconfirm \
    dunst \
    gnutls \
    exa \
    jq \
    xclip \
    xorg-xclipboard \
    xorg-xsetroot \
    feh \
    tree \
    neofetch \
    openssh \
    mpv \
    light \
    scrot \
    figlet \
    the_silver_searcher \
    erlang \
    elixir \
    kitty \
    evtest \
    xcape \
    xorg-font-util \
    xorg-fonts-encodings \
    xorg-xev \
    jdk-openjdk \
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
    xorg-xfontsel \
    restic \
    pfetch \
    xdotool \
    sxhkd \
    fasd \
    fzf \
    pulsemixer \
    docker \
    docker-compose \
    direnv \
    rbenv \
    nodenv \
    nodenv-node-build-git \
    slack-desktop \
    ranger \
    sublime-text-dev \
    google-chrome \
    deluge-git \
    ruby-build \
    pcloud-drive \
    pmount \
    htop \
    colorgrab \
    bcwc-pcie-git \
    bitwarden-bin \
    bitwarden-cli \
    taskell \
    arandr \
    peek \
    libratbag \
    piper \
    inotify-tools \
    bfg \
    discord \
    gnome-calculator \
    rescuetime2 \
    brave-bin \
    polybar-dwm-module \
    bspwm \
    font-manager \
    slock \
    sxiv \
    rofi \
    rofi-greenclip \
    sox \
    protonvpn-cli-ng \
    picom-git \
    w3m \
    graphviz \
    soulseekqt \
    nmap

echo "###############################################"
echo "UNINSTALL BASIC RECIPE (remove cruft)"
echo "###############################################"

# I dont want a greeter
 sudo systemctl disable lightdm.service || echo "lightdm already uninstalled"
 sudo pacman -Rs --noconfirm lightdm \
       light-locker \
       lightdm-gtk-greeter \
       lightdm-gtk-greeter-settings || echo "lightdm already uninstalled"

echo "###############################################"
echo "install lanuguages and enable services"
echo "###############################################"

sudo systemctl enable docker.service
sudo systemctl start docker.service

sudo systemctl enable "syncthing@$USER.service"
sudo systemctl start "syncthing@$USER.service"

sudo systemctl enable "cpupower"
sudo systemctl start "cpupower"

source ~/.zprofile

# stable versions of everything as my default
/usr/bin/rbenv install 2.7.0 || echo "ruby install failed"
~/.exenv/bin/exenv install 1.9.4 || echo "elixir install failed"
/usr/bin/nodenv install 13.6.0 || echo "node install failed"

pushd "$HOME"

/usr/bin/rbenv local 2.7.0
~/.exenv/bin/exenv local 1.9.4
/usr/bin/nodenv local 13.6.0 --compile

# install gcloud
curl https://sdk.cloud.google.com | bash


echo "###############################################"
echo "Install TL"
echo "###############################################"

pushd ~/code/util/ex-tl
mix local.hex --force
mix deps.get --force
mix escript.build
mv ./tl ~/bin

popd
