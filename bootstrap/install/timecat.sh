#! /bin/bash

echo "###############################################"
echo "Install TimeCat"
echo "###############################################"

mkdir -p "$HOME/code/util"
pushd "$HOME/code/util"

rm -fr timecat

git clone git://github.com/HoffsMH/timecat.git

pushd ~/code/util/timecat
  ./bin/install
popd
