#! /bin/bash

set -e

echo "###############################################"
echo "COMMON LINKS"
echo "###############################################"

ln -sf ~/personal/dotfiles/common/.gitignore_global ~/.
ln -sf ~/personal/dotfiles/common/.gitconfig ~/.
ln -sf ~/personal/dotfiles/common/.fzf.zsh ~/.fzf.zsh
ln -sf ~/personal/dotfiles/common/.zsh ~/.
ln -sf ~/personal/dotfiles/common/bin ~/bin

ln -sf ~/code/util/oh-my-zsh ~/.oh-my-zsh
ln -sf ~/code/util/spacemacs ~/.emacs.d
