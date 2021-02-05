#! /bin/bash

set -e

sudo sed -i 's/^#\s*\(%wheel\s\+ALL=(ALL)\s\+NOPASSWD:\s\+ALL\)/\1/' /etc/sudoers

#speed up aur makepkg
sudo sed -i '/MAKEFLAGS=/c\MAKEFLAGS="-j$(nproc)"' /etc/makepkg.conf
sudo sed 's/COMPRESSXZ=(xz -c -z -)/COMPRESSXZ=(xz -T 0 -c -z -)/' /etc/makepkg.conf

echo "###############################################"
echo "YAY BASIC RECIPE"
echo "###############################################"

installs=(
    "pistol-git"
    "arandr"
    "axel"
    "bitwarden-bin"
    "bluez-utils"
    "brave-bin"
    "colorgrab"
    "cups"
    "cups-pdf"
    "direnv"
    "dunst"
    "elixir"
    "erlang"
    "evtest"
    "exa"
    "fasd"
    "feh"
    "flameshot"
    "font-manager"
    "fwup"
    "fzf"
    "gnome-calculator"
    "gnutls"
    "google-chrome"
    "gopass"
    "htop"
    "inotify-tools"
    "jdk-openjdk"
    "jq"
    "libratbag"
    "light"
    "linux-lts-acpi_call"
    "lxappearance"
    "manjaro-architect"
    "mpv"
    "ncurses5-compat-libs"
    "ntfs-3g"
    "openssh"
    "parallel"
    "pcloud-drive"
    "peek"
    "pfetch"
    "piper"
    "pmount"
    "poppler"
    "protonvpn-cli-ng"
    "pulsemixer"
    "ranger"
    "redshift"
    "restic"
    "scrot"
    "seahorse"
    "slack-desktop"
    "slock"
    "sox"
    "squashfs-tools"
    "sshpass"
    "stalonetray"
    "sublime-text-dev"
    "sxhkd"
    "sxiv"
    "neovim"
    "syncthing"
    "taskell"
    "the_silver_searcher"
    "wmctrl"
    "xcape"
    "xclip"
    "xdotool"
    "xorg-font-util"
    "xorg-fonts-encodings"
    "xorg-xclipboard"
    "xorg-xev"
    "xmonad"
    "xmonad-contrib"
    "xorg-xsetroot"
    "zathura"
    "zathura-pdf-poppler"
)

sudo pacman -Syu
yay -Syu

echo $installs
echo $installs | xargs yay -S --noconfirm

yay -S --noconfirm \
    rescuetime2 || echo "rescuetime2 failed"

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
"$HOME/personal/dotfiles/bootstrap/install/dmenu.sh"
"$HOME/personal/dotfiles/bootstrap/install/dwm.sh"
"$HOME/personal/dotfiles/bootstrap/install/tl.sh"
"$HOME/personal/dotfiles/bootstrap/install/docker.sh"
"$HOME/personal/dotfiles/bootstrap/install/yt-dl.sh"
"$HOME/personal/dotfiles/bootstrap/install/yubikey-software.sh"
