source "$HOME/personal/dotfiles/common/.zshrc"

# # copys the current terminal line to clipboard
pbcopyCurrentLine() {
    echo "$BUFFER" | tr -d '\n' | pbcopy
}

zle -N pbcopyCurrentLine pbcopyCurrentLine
