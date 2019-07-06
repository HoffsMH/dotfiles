set -e

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew bundle

../common/create_dirs.sh

../common/get_util.sh

#link the stuff
../common/link_recipe.sh
./link_recipe.sh




chsh
