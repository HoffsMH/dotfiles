set -e

echo "###############################################"
echo "CREATE DIRS"
echo "###############################################"

mkdir -p "$HOME/code/util"
mkdir -p "$HOME/code/paid/"
mkdir -p "$HOME/code/fun/"
mkdir -p "$HOME/personal/00-capture/"
mkdir -p "$HOME/personal/01-schedule/"
mkdir -p "$HOME/personal/media/audio/capture/"
mkdir -p "$HOME/personal/media/video/capture/"
mkdir -p "$HOME/personal/media/image/capture"
mkdir -p "$HOME/personal/media/text/capture"
mkdir -p "$HOME/personal/jrnl"

sudo mkdir -p "/usr/local/opt/zlib/lib"

sudo mkdir -p /media/restic
sudo chown $USER /media/restic

sudo rm -fr ~/.zshrc
sudo rm -fr ~/.zprofile
sudo rm -fr ~/.xinitrc
sudo rm -fr ~/.Xmodmap

echo "###############################################"
echo "COPY sample files"
echo "###############################################"

./samples.sh

echo "###############################################"
echo "setup links"
echo "###############################################"

./links.sh

# media libraries
ln -sf "$HOME/pCloudDrive/personal/media/image/library" "$HOME/personal/media/image/"
ln -sf "$HOME/pCloudDrive/personal/media/audio/library" "$HOME/personal/media/audio/"
ln -sf "$HOME/pCloudDrive/personal/media/video/library" "$HOME/personal/media/video/"
ln -sf "$HOME/pCloudDrive/personal/media/text/library" "$HOME/personal/media/text/"

# home
ln -sf "$HOME/code/util/oh-my-zsh" "$HOME/.oh-my-zsh"
ln -sf "$HOME/code/util/exenv" "$HOME/.exenv"
ln -sf "$HOME/code/util/ayu" "$HOME/.config/sublime-text-3/Packages/"

chmod +x "$HOME/bin/ytgo"
sudo chmod 600 "$HOME/.envrc"
