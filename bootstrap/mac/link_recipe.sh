set -e

echo "###############################################"
echo "MAC LINKS"
echo "###############################################"

mkdir -p ~/.config/kitty
mkdir -p "$HOME/.config/lf"

mkdir -p ~/.ssh
mkdir -p ~/.config/karabiner
mkdir -p ~/.config/skhd
mkdir -p ~/.config/redshift

ln -sf ~/personal/dotfiles/mac/.sshconfig ~/.ssh/config
ln -sf ~/personal/dotfiles/mac/kitty.conf ~/.config/kitty/kitty.conf
ln -sf ~/personal/dotfiles/mac/karabiner.json ~/.config/karabiner/karabiner.json
ln -sf ~/personal/dotfiles/mac/.zshrc ~/.zshrc
ln -sf ~/personal/dotfiles/mac/.spacemacs ~/.spacemacs
ln -sf ~/personal/dotfiles/mac/redshift.conf ~/.config/redshift/


ln -sf ~/personal/dotfiles/linu/lfrc ~/.config/lf/lfrc
ln -sf ~/personal/dotfiles/mac/.skhdrc ~/.skhdrc
ln -sf ~/personal/dotfiles/mac/.yabairc ~/.yabairc
