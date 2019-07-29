#! /bin/bash

set -e

echo "###############################################"
echo "COMMON LINKS"
echo "###############################################"

mkdir -p ~/personal/jrnl
mkdir -p ~/bin

ln -sf ~/personal/dotfiles/common/.gitignore_global ~/.
ln -sf ~/personal/dotfiles/common/.gitconfig ~/.
ln -sf ~/personal/dotfiles/common/.fzf.zsh ~/.fzf.zsh
ln -sf ~/personal/dotfiles/common/.zsh ~/.
ln -sft ~/bin ~/personal/dotfiles/common/bin/*

ln -sf ~/personal/dotfiles/common/jrnl.makefile ~/personal/jrnl/makefile
ln -sf ~/code/util/oh-my-zsh ~/.oh-my-zsh
ln -sf ~/code/util/spacemacs ~/.emacs.d

ln -sf ~/pCloudDrive/personal/media/image/library ~/personal/media/image/
ln -sf ~/pCloudDrive/personal/media/audio/library ~/personal/media/audio
ln -sf ~/pCloudDrive/personal/media/video/library ~/personal/media/video
