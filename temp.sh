#!/bin/zsh

installs=(
    "xdotool"
    "xorg-font-util"
    "xorg-fonts-encodings"
    "xorg-xclipboard"
    "xorg-xev"
    "asdff3f"
    # "xmonad" # window manager
    # "xmonad-contrib" # window manager
    "xorg-xsetroot"
    "zathura" # pdf viewer
    "zathura-pdf-poppler"
    "ntp"
    "openssh"
    "xorg-server"
    "xorg-xwininfo"
    "xorg-xinit"
)

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
    echo "- $i\n" >> failures.md
  fi
done
