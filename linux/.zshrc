source "$HOME/personal/dotfiles/common/.zshrc"
source "$HOME/personal/dotfiles/linux/.zsh/ytdl_widgets.sh"

# redshift automation
# alias blueoff="sudo systemctl start ~/Library/LaunchAgents/com.me.start-redshift.plist"
# alias blueon="launchctl stop ~/Library/LaunchAgents/com.me.start-redshift.plist"

alias endx="killall xinit"

# unmounts my camera and external HD
alias utsp="sudo umount /mnt/tsp* |
  sudo umount /mnt/Untitled* |
  sudo umount /mnt/PMHOME |
  sudo umount /mnt/pi_* |
  sudo umount /mnt/phone_* |
  sudo umount /mnt/camera_* |
  sudo umount /mnt/black_*"

# takes large amount of text wraps it at 80 characters and puts it back into register
alias wrap80="xclip -o | fold -w 80 -s | xclip -selection clipboard"
alias xpaste="xclip -o"
alias xclip="/usr/bin/xclip -selection clipboard"

alias cmenu="clipmenu"

# start the docker daemon
alias dockerstartdaemon='sudo systemctl stop docker.service'

# docker
# stop the docker daemon
alias dockerstopdaemon='sudo systemctl start docker.service'


