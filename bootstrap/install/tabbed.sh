#! /bin/bash

echo "###############################################"
echo "TABBED"
echo "###############################################"

mkdir -p "$HOME/code/util"
pushd "$HOME/code/util"

rm -rf tabbed

git clone git://github.com/HoffsMH/tabbed.git

pushd ~/code/util/tabbed
  sudo make clean install
popd
