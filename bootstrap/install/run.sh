#! /bin/zsh

set -e

#speed up aur makepkg
sudo sed -i '/MAKEFLAGS=/c\MAKEFLAGS="-j$(nproc)"' /etc/makepkg.conf
sudo sed 's/COMPRESSXZ=(xz -c -z -)/COMPRESSXZ=(xz -T 0 -c -z -)/' /etc/makepkg.conf

echo "###############################################"
echo "YAY BASIC RECIPE"
echo "###############################################"

installs=(
    "kitty"
    "tokei" # count lines of code
    "ripgrep"
    "zellij"
    "xcursor-breeze"
    "gruvbox-material-gtk-theme-git" # just for the icons
    "gruvbox-dark-gtk" # my gtk theme
    "arc-gruvbox-theme"
    "networkmanager-iwd"
    "arandr" # arranging screens and saving screen configs
    "axel" # downloader
    "fd" # alternative to find
    "bitwarden-bin" # legacy -- will one day get rid of this
    "bluez"
    "bluez-utils" # connect to bluetooth devices
    "brave-bin" # browser
    "colorgrab" # grab color hex from anywhere on screen
    "cups" # printing
    "cups-pdf" # printings
    "direnv" # env var management
    "dunst" # notifications
    "elixir"
    "erlang"
    "starship" # fast terminal prompt
    "evtest"
    "exa" # alternative to ls
    "fasd" # fuzzy find and switch to recently used directories
    "xwallpaper" # set the wall paper
    "flameshot" # take a screenshot of a specific area on screen
    "font-manager" # manage fonts
    "fzf" # cli fuzzy finder
    "gnome-calculator" # calculator
    "gnutls"
    "google-chrome" # for front-end testing fidelity
    "gopass" # password manager
    "htop" # system process monitor
    "inotify-tools"
    "jdk-openjdk"
    "jq" # command line json parser
    "libratbag"
    "light" # backlight and keyboard like control for laptops
    "lxappearance" # managing gtk themes
    "mpv" # audio and video player
    "ncurses5-compat-libs"
    "ntfs-3g" # for viewing and manipulating windows filesystems
    "openssh"
    "parallel" # for performing tasks in parallel
    "pcloud-drive" # cloud storage provider
    "peek" # Screen cast gifs
    "pfetch" # simple screen fetch
    "piper" # adjusting mouse settings
    "udisks2" # personal drive mounting system that doesn't require sudo
    "poppler" # pdf library
    "protonvpn-cli-ng" # vpn provider
    "pulseaudio-alsa"
    "pulseaudio-bluetooth"
    "pulsemixer" # mixer and volume control
    "thunar"
    "lf-git" # vim like file manager
    "redshift" # blue light reducer
    "restic" # remote backup
    "scrot" # total screenshot taker
    "seahorse"
    "sublime-text-4"
    "slack-desktop"
    "slock"
    "sox"
    "squashfs-tools"
    "sshpass"
    "stalonetray"
    "sxhkd"
    "sxiv"
    "neovim"
    "syncthing"
    "taskell"
    "wmctrl"
    "xcape"
    "xclip" # clipboard command interface
    "xdotool"
    "mediainfo"
    "xorg-font-util"
    "xorg-fonts-encodings"
    "noto-fonts"
    "noto-fonts-emoji"
    "xorg-xclipboard"
    "xorg-xev"
    # "xmonad" # window manager
    # "xmonad-contrib" # window manager
    "xorg-xsetroot"
    "zathura" # pdf viewer
    "zathura-pdf-poppler"
    "ntp"
    "openssh"
    "xorg-xinit"
    "xorg-server"
    "rescuetime2"
    "pistol-git"
    "cpupower"
    "xfce4"
    "xfce4-goodies"
)

sudo pacman -Syu
yay -Syu

echo $installs
for i in $installs
do
  echo "###############################################"
  echo "INSTALLING $i"
  echo "###############################################"
  if yay -S --noconfirm $i ; then
    echo "###############################################"
    echo "SUCCEEDED $i"
    echo "###############################################"
  else
    echo "###############################################"
    echo "FAILED $i"
    echo "###############################################"
    echo "- $i\n" >> failures.md
  fi
done

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
systemctl enable --user dunst.service || echo "dunst service not found"
systemctl start --user dunst.service || echo "starting dunst failed"

sudo systemctl enable bluetooth.service || echo "dunst service not found"
sudo systemctl start bluetooth.service || echo "starting dunst failed"

"$HOME/personal/dotfiles/bootstrap/install/asdf.sh"
"$HOME/personal/dotfiles/bootstrap/install/dmenu.sh"
"$HOME/personal/dotfiles/bootstrap/install/dwm.sh"
"$HOME/personal/dotfiles/bootstrap/install/tl.sh"
"$HOME/personal/dotfiles/bootstrap/install/docker.sh"
"$HOME/personal/dotfiles/bootstrap/install/yt-dl.sh"
"$HOME/personal/dotfiles/bootstrap/install/yubikey-software.sh"
