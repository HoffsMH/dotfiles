#! /bin/bash

echo "###############################################"
echo "ST"
echo "###############################################"

mkdir -p "$HOME/code/util"
pushd "$HOME/code/util"

rm -rf st

git clone git://github.com/HoffsMH/st.git

pushd ~/code/util/st
  sudo make clean install
popd
