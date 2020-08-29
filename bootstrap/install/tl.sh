#! /bin/bash

echo "###############################################"
echo "Install TL"
echo "###############################################"

mkdir -p "$HOME/code/util"
pushd "$HOME/code/util"

rm -fr ex-tl

git clone git://github.com/HoffsMH/ex-tl.git

pushd ~/code/util/ex-tl
  mix local.hex --force
  mix deps.get --force
  mix escript.build
  mv ./tl ~/bin
popd
