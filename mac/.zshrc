source "$HOME/personal/dotfiles/common/.zshrc"

# # copys the current terminal line to clipboard
pbcopyCurrentLine() {
    echo "$BUFFER" | tr -d '\n' | pbcopy
}

zle -N pbcopyCurrentLine pbcopyCurrentLine

# redshift automation
alias blueoff="launchctl load ~/Library/LaunchAgents/com.me.start-redshift.plist"
alias blueon="launchctl unload ~/Library/LaunchAgents/com.me.start-redshift.plist"
