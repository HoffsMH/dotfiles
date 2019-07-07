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
rm -rf spacemacs
rm -rf zsh-syntax-highlighting
rm -rf dwm
rm -rf dmenu

git clone git://github.com/robbyrussell/oh-my-zsh.git
git clone git://github.com/denysdovhan/spaceship-prompt.git
git clone git://github.com/mururu/exenv.git
git clone git://github.com/hlissner/zsh-autopair.git
git clone git://github.com/syl20bnr/spacemacs.git
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git

git clone git://github.com/HoffsMH/dwm.git
git clone git://github.com/HoffsMH/dmenu.git


sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl


popd
