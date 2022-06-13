#! /bin/bash

echo "###############################################"
echo "Install bulksearch"
echo "###############################################"

mkdir -p "$HOME/code/util"
pushd "$HOME/code/util"

rm -fr bulksearch

git clone https://github.com/HoffsMH/bulksearch

pushd ~/code/util/bulksearch

popd
