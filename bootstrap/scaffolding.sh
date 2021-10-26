set -e

sudo sed -i 's/^#\s*\(%wheel\s\+ALL=(ALL)\s\+NOPASSWD:\s\+ALL\)/\1/' /etc/sudoers


echo "###############################################"
echo "CREATE DIRS"
echo "###############################################"

mkdir -p "$HOME/code/paid/"
mkdir -p "$HOME/code/fun/"
mkdir -p "$HOME/personal/00-capture/"
mkdir -p "$HOME/personal/media/audio/capture/"
mkdir -p "$HOME/personal/media/video/capture/"
mkdir -p "$HOME/personal/media/image/capture"
mkdir -p "$HOME/personal/media/text/capture"
mkdir -p "$HOME/personal/media/software/capture"
mkdir -p "$HOME/personal/jrnl"

sudo mkdir -p /media/restic
sudo chown $USER /media/restic

sudo rm -fr ~/.zshrc
sudo rm -fr ~/.zprofile
sudo rm -fr ~/.xinitrc
sudo rm -fr ~/.Xmodmap
sudo rm -fr ~/Documents
sudo rm -fr ~/Downloads
sudo rm -fr ~/Desktop

sudo mkdir -p /usr/share/fonts/OTF
sudo cp -avr $HOME/personal/dotfiles/fonts/OTF/* /usr/share/fonts/OTF

echo "###############################################"
echo "COPY sample files"
echo "###############################################"

"$HOME/personal/dotfiles/bootstrap/samples.sh"

echo "###############################################"
echo "setup links"
echo "###############################################"

"$HOME/personal/dotfiles/bootstrap/links/run.sh"

# media libraries
ln -sf "$HOME/pCloudDrive/personal/media/image/library" "$HOME/personal/media/image/"
ln -sf "$HOME/pCloudDrive/personal/media/audio/library" "$HOME/personal/media/audio/"
ln -sf "$HOME/pCloudDrive/personal/media/video/library" "$HOME/personal/media/video/"
ln -sf "$HOME/pCloudDrive/personal/media/text/library" "$HOME/personal/media/text/"
ln -sf "$HOME/pCloudDrive/personal/media/software/library" "$HOME/personal/media/software/"

# home
ln -sf "$HOME/code/util/asdf" "$HOME/.asdf"

chmod +x "$HOME/bin/ytgo"
sudo chmod 600 "$HOME/.envrc"
