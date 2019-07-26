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
mkdir -p "$HOME/bin"

mkdir -p "$HOME/personal/media/image"
mkdir -p "$HOME/personal/media/image/wall"
mkdir -p "$HOME/personal/media/image/ss"
mkdir -p "$HOME/.yt-dl-archive/"

touch "$HOME/.yt-dl-archive/archive"

cp "$HOME/personal/dotfiles/linux/dlscript.sh" "$HOME/bin/ytgo"
chmod +x "$HOME/bin/ytgo"
