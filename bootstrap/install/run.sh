#! /bin/zsh

set -e

#speed up aur makepkg
sudo sed -i '/MAKEFLAGS=/c\MAKEFLAGS="-j$(nproc)"' /etc/makepkg.conf
sudo sed 's/COMPRESSXZ=(xz -c -z -)/COMPRESSXZ=(xz -T 0 -c -z -)/' /etc/makepkg.conf


echo "###############################################"
echo "YAY BASIC RECIPE"
echo "###############################################"

installs=(
    "acpi" # battery monitor
    "iptables-nft" # docker compose will try to use an option on the legacy version of iptables that no longer exists
    "acpid"
    "dnsutils" # dig
    "ansible" # cfm
    "arandr" # arranging screens and saving screen configs
    "arc-icon-theme" # needed for battery widget in awesome wm
    "awesome-git" # wm
    "axel" # downloader
    "debtap"
    "bandwhich-git" # bandwidth monitoring tool
    "bitwarden-bin" # legacy -- will one day get rid of this
    "blueman-git" # bluetooth gui
    "bluez"
    "chafa"
    "bluez-utils" # connect to bluetooth devices
    "brave-bin" # browser
    "cht.sh-git" # fast help
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
    "fd-git" # alternative to find
    "flameshot" # take a screenshot of a specific area on screen
    "webkit2gtk" # undocumented dependency of font-manager :(
    "font-manager" # manage fonts
    "fzf" # cli fuzzy finder
    "gfold-git" # see git repo status across many repos
    "git-delta-git" # diff viewer
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
    "lazygit-git" # git gui
    "postgresql"
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
    "ristretto" # no keybind memory needed image browser
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
    "code"
    "dbeaver"
    "gimp"
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
    "tmux" # lovehate this
    "zip"
    "zoxide-git"
    "postgresql"
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
"$HOME/personal/dotfiles/bootstrap/install/timecat.sh"
