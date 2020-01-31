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
    discord \
    gnome-calculator \
    lolcat \
    rescuetime2

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

sudo chmod -x "$HOME/.config/systemd/user/restic-backup.timer"
sudo chmod -x "$HOME/.config/systemd/user/restic-backup.service"

systemctl --user enable restic-backup.timer || echo "restic systemctl failing"
systemctl --user start restic-backup.timer || echo "restic systemctl failing"

echo "###############################################"
echo "Install TL"
echo "###############################################"

pushd ~/code/util/ex-tl
mix local.hex --force
mix deps.get --force
mix escript.build
mv ./tl ~/bin

popd
