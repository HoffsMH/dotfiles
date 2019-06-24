source "$HOME/personal/dotfiles/common/.zshrc"

# # copys the current terminal line to clipboard
pbcopyCurrentLine() {
    echo "$BUFFER" | tr -d '\n' | pbcopy
}

zle -N pbcopyCurrentLine pbcopyCurrentLine

# Google Chrome
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
alias canary='/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary'
alias firefox='/Applications/Firefox\ Developer\ Edition.app/'
