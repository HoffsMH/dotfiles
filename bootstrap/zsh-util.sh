#! /bin/bash

set -e

echo "###############################################"
echo "ZSH UTIL"
echo "###############################################"

pushd "$HOME"

rm -rf oh-my-zsh
rm -rf powerlevel10k
rm -rf zsh-autopair
rm -rf zsh-syntax-highlighting

git clone git://github.com/robbyrussell/oh-my-zsh.git
git clone git://github.com/romkatv/powerlevel10k.git
git clone git://github.com/hlissner/zsh-autopair.git
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
