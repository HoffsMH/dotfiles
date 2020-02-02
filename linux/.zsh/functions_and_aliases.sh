source "$HOME/personal/dotfiles/common/.zsh/functions_and_aliases.sh"
# takes large amount of text wraps it at 80 characters and puts it back into register
alias wrap80="xclip -o | fold -w 80 -s | xclip -selection clipboard"

alias ytclear='cp -f "$HOME/personal/dotfiles/linux/dlscript.sh" "$HOME/bin/ytgo"'

######################################################
# media
######################################################
alias play="mpv --no-audio-display --loop-playlist"
alias pm="pulsemixer"

######################################################
# clipboard
######################################################
alias xpaste="xclip -o"
alias xclip="/usr/bin/xclip -selection clipboard"
alias cmenu="clipmenu"

######################################################
# history
######################################################
fh() {
    local seshist=$([ -n "$ZSH_NAME" ] && fc -l 1 || history)
    local zshhist=$(cat ~/.zsh_history)

    # linux needs -r
    print -z $(echo $zshhist $seshist | fzf +s --tac | sed -r 's/( *: *[0-9]*:0;\*? *)|( *[0-9]*\*? *)//' | sed -r 's/\\/\\\\/g')
}

fhl() {
    local seshist=$([ -n "$ZSH_NAME" ] && fc -l 1 || history)
    local zshhist=$(cat ~/.zsh_history)

    # linux needs -r
    print $(echo $zshhist $seshist | fzf +s --tac | sed -r 's/( *: *[0-9]*:0;\*? *)|( *[0-9]*\*? *)//' | sed -r 's/\\/\\\\/g')
}

######################################################
# disks
######################################################
# unmounts my camera and external HD
alias utsp="sudo umount /mnt/tsp* |
  sudo umount /mnt/Untitled* |
  sudo umount /mnt/PMHOME |
  sudo umount /mnt/pi_* |
  sudo umount /mnt/phone_* |
  sudo umount /mnt/camera_* |
  sudo umount /mnt/black_*"

######################################################
# files
######################################################

alias open="xdg-open"
alias sucap="subl ~/personal/00-capture/capture.md"
alias jf='SHELL=~/bin/r.shell ranger'
alias jfa='jf ~/personal/media/audio'

######################################################
# docker
######################################################
# start the docker daemon
alias dockerstartdaemon='sudo systemctl stop docker.service'

# docker
# stop the docker daemon
alias dockerstopdaemon='sudo systemctl start docker.service'

task() {
    pushd $HOME/personal/01-schedule/board
    taskell
    popd
}


######################################################
# Text Editing
######################################################
alias subl="subl3"

######################################################
# Displays and wallpaper
######################################################

setdmonpicale() {
  xrandr --output $1 --scale $2
}

setdp1cale() {
  setdmonpicale "DisplayPort-1" $1
}

sethdmiscale() {
  setdmonpicale "HDMI-0" $1
}

alias setwall="feh --bg-scale ~/.wall.jpg"

######################################################
# WM and session
######################################################

alias xfcesesh="export SESSION=xfce4-session && startx"
alias dwmsesh="export SESSION=dwm && startx"
alias bspwmsesh="export SESSION=bspwm && startx"
alias getwindowname="xprop | grep WM_CLASS"


######################################################
# Restic and backup stuff
######################################################

# specify your repo with env variable or -r
alias resticinit="restic init"
alias resticbrowse="restic mount /media/restic"
alias resticbackup="restic backup --verbose --tag systemd.timer $BACKUP_EXCLUDES $BACKUP_PATHS"
