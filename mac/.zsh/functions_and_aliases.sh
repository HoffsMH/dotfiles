source "$HOME/personal/dotfiles/common/.zsh/functions_and_aliases.sh"

######################################################
# misc
######################################################

# redshift automation
alias blueoff="launchctl load ~/Library/LaunchAgents/com.me.start-redshift.plist"
alias blueon="launchctl unload ~/Library/LaunchAgents/com.me.start-redshift.plist"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktopicons="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktopicons="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# takes large amount of text wraps it at 80 characters and puts it back into register
alias wrap80="pbpaste | fold -w 80 -s | pbcopy"

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# provide a notification that a long runnning script is complete e.g long_running_script && ding
ding() {
    osascript -e 'display notification "'$1'" with title "'$2'" sound name "Glass"'
}

######################################################
# history
######################################################
# searches all history

fh() {
    local seshist=$([ -n "$ZSH_NAME" ] && fc -l 1 || history)
    local zshhist=$(cat ~/.zsh_history)

    # mac needs -E
    print -z $(echo $zshhist $seshist | fzf +s --tac | sed -E 's/( *: *[0-9]*:0;\*? *)|( *[0-9]*\*? *)//' | sed -E 's/\\/\\\\/g')
}

fhl() {
    local seshist=$([ -n "$ZSH_NAME" ] && fc -l 1 || history)
    local zshhist=$(cat ~/.zsh_history)

    # mac needs -E
    print $(echo $zshhist $seshist | fzf +s --tac | sed -E 's/( *: *[0-9]*:0;\*? *)|( *[0-9]*\*? *)//' | sed -E 's/\\/\\\\/g')
}

######################################################
# networking
######################################################

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"

# Show active network interfaces
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

######################################################
# docker
######################################################

# start the docker daemon
alias dockerstartdaemon='open -a Docker'

# docker
# stop the docker daemon
dockerstopdaemon() {
    osascript -e 'quit app "Docker"'
}

######################################################
# disks
######################################################

# unmounts my camera and external HD
alias utsp="diskutil umount /Volumes/tsp* |
  diskutil umount /Volumes/Untitled* |
  diskutil umount /Volumes/PMHOME |
  diskutil umount /Volumes/pi_* |
  diskutil umount /Volumes/phone_* |
  diskutil umount /Volumes/camera_* |
  diskutil umount /Volumes/black_*"


