#! /bin/bash

set -e

echo "###############################################"
echo "ZSH UTIL"
echo "###############################################"

pushd "$HOME"

rm -rf .zsh-autopair
rm -rf .fast-syntax-highlighting

git clone git://github.com/hlissner/zsh-autopair.git .zsh-autopair || echo "zsh-auto-pair failed"
git clone git://github.com/zdharma-continuum/fast-syntax-highlighting.git .fast-syntax-highlighting || echo "zsh-fast-syntax-highlighting failed"
