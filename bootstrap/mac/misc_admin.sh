set -e

echo "###############################################"
echo "MISC ADMIN"
echo "###############################################"

cp "$HOME/personal/dotfiles/mac/dlscript.sh" "$HOME/personal/media/dlscript.sh"
brew services start postgresql       
brew services start syncthing
brew services start redis            
brew services start redshift         
brew services start skhd             
brew services start yabai          

chsh
