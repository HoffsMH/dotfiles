#! /bin/bash

echo "###############################################"
echo "DMENU"
echo "###############################################"

mkdir -p "$HOME/code/util"
pushd "$HOME/code/util"

rm -rf dmenu

git clone git://github.com/HoffsMH/dmenu.git

pushd ~/code/util/dmenu
  sudo make clean install
popd
