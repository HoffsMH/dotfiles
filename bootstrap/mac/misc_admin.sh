set -e

echo "###############################################"
echo "MISC ADMIN"
echo "###############################################"

defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

cp "$HOME/personal/dotfiles/mac/dlscript.sh" "$HOME/bin/ytgo"
brew services start postgresql
brew services start syncthing
brew services start redis
brew services start redshift
brew services start skhd
brew services start yabai

chsh
