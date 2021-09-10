#! /bin/bash
echo "###############################################"
echo "ASDF"
echo "###############################################"

mkdir -p "$HOME/code/util"
pushd "$HOME/code/util"

rm -fr asdf

git clone git://github.com/asdf-vm/asdf.git

echo "###############################################"
echo "install languages"
echo "###############################################"

pushd ~/code/util/asdf
  git checkout "$(git describe --abbrev=0 --tags)"
popd
ln -sf "$HOME/code/util/asdf" "$HOME/.asdf"

source ~/.zprofile

pushd "$HOME"

. $HOME/.asdf/asdf.sh

asdf plugin add ruby
asdf plugin add elixir
asdf plugin add nodejs
bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'

# zlib directories need to be present ahead of time in order for asdf to
# install new versions of ruby
sudo mkdir -p /usr/local/opt/zlib/lib
asdf install ruby
asdf install elixir
asdf install nodejs

asdf global ruby 2.7.0
asdf global elixir 1.9.4
asdf global nodejs 13.6.0

popd
