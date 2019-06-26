source "$HOME/personal/dotfiles/common/.zshrc"

# # copys the current terminal line to clipboard
pbcopyCurrentLine() {
    echo "$BUFFER" | tr -d '\n' | pbcopy
}

zle -N pbcopyCurrentLine pbcopyCurrentLine

# redshift automation
alias blueoff="launchctl load ~/Library/LaunchAgents/com.me.start-redshift.plist"
alias blueon="launchctl unload ~/Library/LaunchAgents/com.me.start-redshift.plist"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"

# Show active network interfaces
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

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

# unmounts my camera and external HD
alias utsp="diskutil umount /Volumes/tsp* |
  diskutil umount /Volumes/Untitled* |
  diskutil umount /Volumes/PMHOME |
  diskutil umount /Volumes/pi_* |
  diskutil umount /Volumes/phone_* |
  diskutil umount /Volumes/camera_* |
  diskutil umount /Volumes/black_*"
