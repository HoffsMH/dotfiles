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
    fwup \
    python-pillow-git \
    openssh-askpass \
    squashfs-tools \
    ncurses5-compat-libs \
    stalonetray \
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
    pfetch \
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
    xorg-xfontsel \
    restic \
    xdotool \
    sxhkd \
    fasd \
    fzf \
    pulsemixer \
    docker \
    docker-compose \
    direnv \
    slack-desktop \
    ranger \
    sublime-text-dev \
    google-chrome \
    ruby-build \
    pcloud-drive \
    pmount \
    htop \
    colorgrab \
    bitwarden-bin \
    bitwarden-cli \
    taskell \
    arandr \
    peek \
    libratbag \
    piper \
    inotify-tools \
    bfg \
    gnome-calculator \
    rescuetime2 \
    brave-bin \
    polybar-dwm-module \
    font-manager \
    slock \
    sxiv \
    rofi \
    rofi-greenclip \
    sox \
    protonvpn-cli-ng \
    picom-git \
    w3m \

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

# use dunst for notifications
systemctl disable --user xfce4-notifyd.service || echo "stock notifications already uninstalled"
systemctl stop --user xfce4-notifyd.service || echo "stock notifications already stopped"
systemctl enable --user dunst.service
systemctl start --user dunst.service

source ~/.zprofile

pushd "$HOME"

asdf plugin add ruby
asdf plugin add elixir
asdf plugin add nodejs
bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'

asdf install ruby 2.7.0
asdf install elixir 1.9.4
asdf install nodejs 13.6.0

asdf global ruby 2.7.0
asdf global elixir 1.9.4
asdf global nodejs 13.6.0

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

yay -R --noconfirm \
    firefox
