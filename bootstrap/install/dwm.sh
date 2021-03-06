#! /bin/bash

echo "###############################################"
echo "DWM"
echo "###############################################"

mkdir -p "$HOME/code/util"
pushd "$HOME/code/util"

rm -rf dwm

git clone git://github.com/HoffsMH/dwm-clean.git

pushd ~/code/util/dwm-clean
  sudo make clean install
popd
