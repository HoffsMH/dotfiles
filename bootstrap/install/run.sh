#! /bin/zsh

set -e

#speed up aur makepkg
sudo sed -i '/MAKEFLAGS=/c\MAKEFLAGS="-j$(nproc)"' /etc/makepkg.conf
sudo sed 's/COMPRESSXZ=(xz -c -z -)/COMPRESSXZ=(xz -T 0 -c -z -)/' /etc/makepkg.conf


echo "###############################################"
echo "YAY BASIC RECIPE"
echo "###############################################"

installs=(
    "awesome-git" # wm
    "git-delta-git" # diff viewer
    "ansible" # cfm
    "arandr" # arranging screens and saving screen configs
    "axel" # downloader
    "bandwhich-git" # bandwidth monitoring tool
    "bitwarden-bin" # legacy -- will one day get rid of this
    "blueman-git" # bluetooth gui
    "bluez"
    "bluez-utils" # connect to bluetooth devices
    "brave-bin" # browser
    "colorgrab" # grab color hex from anywhere on screen
    "cpupower"
    "cups" # printing
    "cups-pdf" # printings
    "direnv" # env var management
    "dunst" # notifications
    "elixir"
    "erlang"
    "evtest"
    "exa" # alternative to ls
    "zoxide-git"
    "fd-git" # alternative to find
    "flameshot" # take a screenshot of a specific area on screen
    "font-manager" # manage fonts
    "fzf" # cli fuzzy finder
    "gfold-git" # see git repo status across many repos
    "gnome-calculator" # calculator
    "gnutls"
    "google-chrome" # for front-end testing fidelity
    "gopass" # password manager
    "gruvbox-dark-gtk" # my gtk theme
    "gruvbox-material-gtk-theme-git" # just for the icons
    "htop" # system process monitor
    "inotify-tools"
    "jdk-openjdk"
    "jq" # command line json parser
    "kitty"
    "lf-git" # vim like file manager
    "libratbag"
    "light" # backlight and keyboard like control for laptops
    "lxappearance" # managing gtk themes
    "mediainfo"
    "mpv" # audio and video player
    "ncurses5-compat-libs"
    "neovim"
    "network-manager-applet"
    "noto-fonts"
    "noto-fonts-emoji"
    "ntfs-3g" # for viewing and manipulating windows filesystems
    "ntp"
    "openssh"
    "openssh"
    "parallel" # for performing tasks in parallel
    "pcloud-drive" # cloud storage provider
    "peek" # Screen cast gifs
    "pfetch" # simple screen fetch
    "piper" # adjusting mouse settings
    "pistol-git"
    "poppler" # pdf library
    "protonvpn-cli-ng" # vpn provider
    "pueue-git" # process queue
    "pulseaudio-alsa"
    "pulseaudio-bluetooth"
    "pulsemixer" # mixer and volume control
    "redshift" # blue light reducer
    "rescuetime2"
    "restic" # remote backup
    "ripgrep"
    "scrot" # total screenshot taker
    "seahorse"
    "slack-desktop"
    "slock"
    "sox"
    "squashfs-tools"
    "sshpass"
    "stalonetray"
    "starship" # fast terminal prompt
    "sublime-text-4"
    "sxhkd"
    "sxiv"
    "syncthing"
    "taskell"
    "thunar"
    "tokei" # count lines of code
    "udisks2" # personal drive mounting system that doesn't require sudo
    "unzip"
    "wmctrl"
    "xcape"
    "xclip" # clipboard command interface
    "xcursor-breeze"
    "xdotool"
    "xorg-font-util"
    "xorg-fonts-encodings"
    "xorg-server"
    "xorg-xclipboard"
    "xorg-xev"
    "xorg-xinit"
    "xorg-xsetroot"
    "xwallpaper" # set the wall paper
    "zathura" # pdf viewer
    "zathura-pdf-poppler"
    "zellij-git"
    "zip"
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
