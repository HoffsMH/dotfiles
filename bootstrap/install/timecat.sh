#! /bin/bash

echo "###############################################"
echo "Install TimeCat"
echo "###############################################"

mkdir -p "$HOME/code/util"
pushd "$HOME/code/util"

rm -fr timecat

git clone https://github.com/HoffsMH/timecat

pushd ~/code/util/timecat
  ./bin/install
popd


echo "###############################################"
echo "Install binlist"
echo "###############################################"

mkdir -p "$HOME/code/util"
pushd "$HOME/code/util"

rm -fr binlist

git clone https://github.com/HoffsMH/binlist

pushd ~/code/util/binlist
  ./bin/install
popd

echo "###############################################"
echo "Install bulksearch"
echo "###############################################"

mkdir -p "$HOME/code/util"
pushd "$HOME/code/util"

rm -fr bulksearch

git clone https://github.com/HoffsMH/bulksearch

pushd ~/code/util/bulksearch
  ./bin/install
popd
