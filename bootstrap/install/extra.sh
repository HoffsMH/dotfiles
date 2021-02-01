
extras=(
  # "bfg"
  # "figlet"
  # "ruby-build" # may need a mkdir somewhere in /
  # "neofetch"
  # "trezor-suite-appimage"
  # "phoronix-test-suite"
  # "discord"
  # "bspwm"
  # "soulseekqt"
  # "deluge-git"
  # "graphviz"
  # "filezilla"
  # "nmap"
  "balena-etcher"
  # "vagrant"
  # "zenm"
)

echo $extras

echo $extras | xargs yay -S --noconfirm
