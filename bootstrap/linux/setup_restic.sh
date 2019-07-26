

echo "###############################################"
echo "SETTING UP RESTIC BACKUPS REMEMBER TO CHECK restic-backup.conf"
echo "###############################################"

mkdir -p ~/.config/systemd/user/
mkdir -p ~/.config/restic

ln -sf ~/personal/dotfiles/linux/.restic_excludes ~/.
ln -sf ~/personal/dotfiles/linux/restic-backup.service ~/.config/systemd/user/restic-backup.service
ln -sf ~/personal/dotfiles/linux/restic-backup.timer ~/.config/systemd/user/restic-backup.timer

cp ~/personal/dotfiles/linux/restic-backup.conf.sample ~/.config/restic/restic-backup.conf



