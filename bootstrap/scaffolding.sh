set -e

echo "###############################################"
echo "CREATE DIRS"
echo "###############################################"

mkdir -p "$HOME/.config/kitty"
mkdir -p "$HOME/.config/conky"
mkdir -p "$HOME/.config/sxhkd"
mkdir -p "$HOME/.config/redshift"
mkdir -p "$HOME/.config/ranger"
mkdir -p "$HOME/.config/systemd/user/"
mkdir -p "$HOME/.config/restic"
mkdir -p "$HOME/.config/bspwm"
mkdir -p "$HOME/.config/polybar"
mkdir -p "$HOME/.config/picom"
mkdir -p "$HOME/.config/sxiv/exec"
mkdir -p "$HOME/.config/rofi"
mkdir -p "$HOME/code/util"
mkdir -p "$HOME/code/paid/"
mkdir -p "$HOME/code/fun/"
mkdir -p "$HOME/personal/00-capture/"
mkdir -p "$HOME/personal/01-schedule/"
mkdir -p "$HOME/personal/media/audio/capture/"
mkdir -p "$HOME/personal/media/video/capture/"
mkdir -p "$HOME/personal/media/image/capture"
mkdir -p "$HOME/personal/jrnl"
mkdir -p "$HOME/bin"
sudo mkdir -p "/usr/local/opt/zlib/lib"
mkdir -p "$HOME/.yt-dl-archive/"
sudo mkdir -p /media/restic
mkdir -p "$HOME/.config/sublime-text-3/Packages/User"
sudo rm /etc/fonts/conf.d/70-no-bitmaps.conf


echo "###############################################"
echo "TOUCH empty files"
echo "###############################################"

touch "$HOME/.yt-dl-archive/archive"

echo "###############################################"
echo "COPY sample files"
echo "###############################################"

cp -f "$HOME/personal/dotfiles/linux/dlscript.sh" "$HOME/bin/ytgo"
cp  "$HOME/personal/dotfiles/common/.envrc.sample" "$HOME/.envrc"
cp "$HOME/personal/dotfiles/linux/restic-backup.conf.sample" "$HOME/.config/restic/restic-backup.conf"
cp "$HOME/personal/dotfiles/config/sample/.Xresources" "$HOME/.Xresources"

echo "###############################################"
echo "setup links"
echo "###############################################"

# restic backup
ln -sf "$HOME/personal/dotfiles/linux/.restic_excludes" "$HOME/."
ln -sf "$HOME/personal/dotfiles/linux/restic-backup.service" "$HOME/.config/systemd/user/restic-backup.service"
ln -sf "$HOME/personal/dotfiles/linux/restic-backup.timer" "$HOME/.config/systemd/user/restic-backup.timer"

# media libraries
ln -sf "$HOME/pCloudDrive/personal/media/image/library" "$HOME/personal/media/image/"
ln -sf "$HOME/pCloudDrive/personal/media/audio/library" "$HOME/personal/media/audio/"
ln -sf "$HOME/pCloudDrive/personal/media/video/library" "$HOME/personal/media/video/"

# home
ln -sf "$HOME/personal/dotfiles/common/.gitignore_global" "$HOME/."
ln -sf "$HOME/personal/dotfiles/common/.gitconfig" "$HOME/."
ln -sf "$HOME/personal/dotfiles/common/.fzf.zsh" "$HOME/.fzf.zsh"
ln -sf "$HOME/code/util/oh-my-zsh" "$HOME/.oh-my-zsh"
ln -sft "$HOME/bin" $HOME/personal/dotfiles/common/bin/*
ln -sf "$HOME/personal/dotfiles/linux/.xinitrc" "$HOME/.xinitrc"
ln -sf "$HOME/personal/dotfiles/linux/.Xmodmap" "$HOME/.Xmodmap"
ln -sf "$HOME/personal/dotfiles/linux/.profile" "$HOME/.zprofile"
ln -sf "$HOME/personal/dotfiles/linux/.zshrc" "$HOME/.zshrc"
ln -sf "$HOME/personal/dotfiles/common/.iex.exs" "$HOME/."
ln -sf "$HOME/personal/dotfiles/common/.miex_helpers.exs" "$HOME/."
ln -sf "$HOME/code/util/exenv" "$HOME/.exenv"

# .config
ln -sf "$HOME/personal/dotfiles/config/sxhkdrc.bspwm" "$HOME/.config/sxhkd/sxhkdrc"
ln -sf "$HOME/personal/dotfiles/config/kitty.conf" "$HOME/.config/kitty/kitty.conf"
ln -sf "$HOME/personal/dotfiles/linux/conky.conf" "$HOME/.config/conky/conky.conf"
ln -sf "$HOME/personal/dotfiles/linux/redshift.conf" "$HOME/.config/redshift/"
ln -sf "$HOME/personal/dotfiles/linux/rc.conf" "$HOME/.config/ranger/"
ln -sf "$HOME/personal/dotfiles/config/bspwmrc" "$HOME/.config/bspwm/"
ln -sf "$HOME/personal/dotfiles/config/polybarconfig" "$HOME/.config/polybar/config"
ln -sf "$HOME/personal/dotfiles/config/picom.conf" "$HOME/.config/picom/"
ln -sf "$HOME/personal/dotfiles/config/sxiv-key-handler" "$HOME/.config/sxiv/exec/key-handler"
ln -sf "$HOME/personal/dotfiles/config/config.rasi" "$HOME/.config/rofi/config.rasi"

ln -sf ~/personal/dotfiles/linux/Preferences.sublime-settings ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
ln -sf ~/personal/dotfiles/linux/Package\ Control.sublime-settings ~/.config/sublime-text-3/Packages/User/Package\ Control.sublime-settings
ln -sf ~/personal/dotfiles/linux/Default\ \(Linux\).sublime-keymap ~/.config/sublime-text-3/Packages/User/Default\ \(Linux\).sublime-keymap
ln -sf ~/personal/dotfiles/common/ayu ~/.config/sublime-text-3/Packages/



echo "###############################################"
echo "Ensure permissions"
echo "###############################################"

chmod +x "$HOME/bin/ytgo"
sudo chmod 600 "$HOME/.envrc"
sudo chown $USER /media/restic


