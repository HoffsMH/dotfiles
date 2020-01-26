set -e

echo "###############################################"
echo "GET UTILS"
echo "###############################################"

mkdir -p "$HOME/code/util"
pushd "$HOME/code/util"

rm -rf oh-my-zsh
rm -rf spaceship-prompt
rm -rf exenv
rm -rf zsh-autopair
rm -rf zsh-syntax-highlighting
rm -rf dwm
rm -rf dmenu

git clone git://github.com/robbyrussell/oh-my-zsh.git
git clone git://github.com/denysdovhan/spaceship-prompt.git
git clone git://github.com/exenv/exenv.git
git clone git://github.com/mururu/elixir-build.git ~/code/util/exenv/plugins/elixir-build

git clone git://github.com/hlissner/zsh-autopair.git
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git

git clone git://github.com/HoffsMH/dwm.git
git clone git://github.com/HoffsMH/dmenu.git


# Install absolute latest of yt-dl
# This should be extracted to its own script later
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod +x /usr/local/bin/youtube-dl


popd
