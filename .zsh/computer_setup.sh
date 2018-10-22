
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

git clone https://github.com/exenv/exenv.git ~/.exenv
git clone git://github.com/mururu/elixir-build.git ~/.exenv/plugins/elixir-build

brew install mackup
brew install rbenv
brew install nodenv
brew install gist
nodenv install -f
