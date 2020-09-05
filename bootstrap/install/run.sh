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
    sshpass \
    gopass \
    linux-lts-acpi_call \
    taskell \
    lxappearance \
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
    expect \
    w3m \
    yubikey-manager \
    yubikey-manager-qt \
    yubioath-desktop \
    yajl


echo "###############################################"
echo "enable services"
echo "###############################################"

sudo systemctl enable "syncthing@$USER.service"
sudo systemctl start "syncthing@$USER.service"

sudo systemctl enable "cpupower"
sudo systemctl start "cpupower"

# use dunst for notifications
systemctl disable --user xfce4-notifyd.service || echo "stock notifications already uninstalled"
systemctl stop --user xfce4-notifyd.service || echo "stock notifications already stopped"
systemctl enable --user dunst.service
systemctl start --user dunst.service || echo "starting dunst failed"

"$HOME/personal/dotfiles/bootstrap/install/asdf.sh"
"$HOME/personal/dotfiles/bootstrap/install/gcloud.sh"
"$HOME/personal/dotfiles/bootstrap/install/dwm.sh"
"$HOME/personal/dotfiles/bootstrap/install/tl.sh"
"$HOME/personal/dotfiles/bootstrap/install/docker.sh"
