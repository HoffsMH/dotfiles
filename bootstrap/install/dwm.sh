#! /bin/bash

echo "###############################################"
echo "DWM"
echo "###############################################"

mkdir -p "$HOME/code/util"
pushd "$HOME/code/util"

rm -rf dwm

git clone https://github.com/HoffsMH/dwm-clean

pushd ~/code/util/dwm-clean
  sudo make clean install
popd
