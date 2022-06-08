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
    "acpid"
    "ansible" # cfm
    "anydesk" # remote desk 
    "arandr" # arranging screens and saving screen configs
    "arc-icon-theme" # needed for battery widget in awesome wm
    "awesome-git" # wm
    "axel" # downloader
    "bandwhich-git" # bandwidth monitoring tool
    "bat" # rust cat
    "bitwarden-bin" # legacy -- will one day get rid of this
    "blueman-git" # bluetooth gui
    "bluez"
    "bluez-utils" # connect to bluetooth devices
    "bookworm" # e-reader
    "brave-bin" # browser
    "chafa"
    "cht.sh-git" # fast help
    "code"
    "colorgrab" # grab color hex from anywhere on screen
    "cpupower"
    "cups" # printing
    "cups-pdf" # printings
    "dbeaver"
    "debtap"
    "direnv" # env var management
    "discord"
    "dnsutils" # dig
    "dunst" # notifications
    "elixir"
    "erlang"
    "etcher" # burning pis and boot discs
    "evtest"
    "exa" # alternative to ls
    "fd-git" # alternative to find
    "ffmpegthumbnailer"
    "flameshot" # take a screenshot of a specific area on screen
    "font-manager" # manage fonts
    "fzf" # cli fuzzy finder
    "gfold-git" # see git repo status across many repos
    "gimp"
    "git-delta-git" # diff viewer
    "gnome-calculator" # calculator
    "gnutls"
    "google-chrome" # for front-end testing fidelity
    "gopass" # password manager
    "gruvbox-dark-gtk" # my gtk theme
    "gruvbox-material-gtk-theme-git" # just for the icons
    "htop" # system process monitor
    "imagemagick"
    "inotify-tools"
    "iptables-nft" # docker compose will try to use an option on the legacy version of iptables that no longer exists
    "iso-image"
    "jdk-openjdk"
    "jq" # command line json parser
    "kitty"
    "pinentry-dispatch"
    "pinentry-git"
    "lazygit-git" # git gui
    "ledger-live" # crypto : (
    "lf-git" # vim like file manager
    "libratbag"
    "libreoffice"
    "light" # backlight and keyboard like control for laptops
    "lxappearance" # managing gtk themes
    "mediainfo"
    "mlvd" # vpn
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
    "polkit"
    "poppler"
    "poppler" # pdf library
    "postgresql"
    "postgresql"
    "protonvpn-cli-ng" # vpn provider
    "pueue-git" # process queue
    "pulseaudio-alsa"
    "pulseaudio-bluetooth"
    "pulsemixer" # mixer and volume control
    "qimgv"
    "redshift" # blue light reducer
    "rescuetime2"
    "resolvconf"
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
    "tmux" # lovehate this
    "tokei" # count lines of code
    "code"
    "dbeaver" # sql exploration
    "gimp"
    "udisks2" # personal drive mounting system that doesn't require sudo
    "ueberzug" # kitty image and video preview
    "unzip"
    "via-bin" # keyboard conifuration
    "webkit2gtk" # undocumented dependency of font-manager :(
    "wg-quick"
    "wkhtmltopdf"
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
    "ytfzf" # youtube fzf
    "zathura" # pdf viewer
    "zathura-pdf-poppler"
    "zip"
    "zoom" # in a post covid world
    "zoxide-git"
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
"$HOME/personal/dotfiles/bootstrap/install/paru.sh"
