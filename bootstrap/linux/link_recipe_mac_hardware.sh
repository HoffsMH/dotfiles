./link_recipe.sh

rm -fr ~/.Xresources
rm -fr ~/.Xmodmap

ln -sf ~/personal/dotfiles/linux/.Xresources.mac ~/.Xresources
ln -sf ~/personal/dotfiles/linux/.Xmodmap.mac ~/.Xmodmap
