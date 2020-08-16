set -e

echo "###############################################"
echo "GET UTILS"
echo "###############################################"

mkdir -p "$HOME/code/util"
pushd "$HOME/code/util"

rm -rf oh-my-zsh
rm -rf spaceship-prompt
rm -fr ex-tl
rm -rf zsh-autopair
rm -rf zsh-syntax-highlighting
rm -rf dwm
rm -fr asdf

git clone git://github.com/robbyrussell/oh-my-zsh.git
git clone git://github.com/denysdovhan/spaceship-prompt.git
git clone git://github.com/asdf-vm/asdf.git

git clone git://github.com/hlissner/zsh-autopair.git
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git

git clone git://github.com/HoffsMH/dwm.git
git clone git://github.com/HoffsMH/ex-tl.git

# Install absolute latest of yt-dl
# This should be extracted to its own script later
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod +x /usr/local/bin/youtube-dl

yay -S --noconfirm yajl
pushd ~/code/util/dwm
sudo make clean install
popd

# will get exenv on our path
source ~/.zprofile
pushd ~/code/util/exenv
 ./src/configure && make -C src
popd

pushd ~/code/util/asdf
  git checkout "$(git describe --abbrev=0 --tags)"
popd
ln -sf "$HOME/code/util/asdf" "$HOME/.asdf"


asdf plugin add nodejs
bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'
