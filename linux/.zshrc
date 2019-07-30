
# sets up oh-my-zsh
source ~/personal/dotfiles/common/.zsh/oh_my_zsh_settings.sh

# fzf settings
source ~/personal/dotfiles/common/.zsh/fzf_settings.sh

# all my stuff
source "$HOME/personal/dotfiles/linux/.zsh/ytdl.sh"
source "$HOME/personal/dotfiles/linux/.zsh/functions_and_aliases.sh"

# shell hooks
source ~/personal/dotfiles/common/.zsh/hooks.sh

source ~/personal/dotfiles/common/.zsh/util.sh


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/hoffs/google-cloud-sdk/path.zsh.inc' ]; then . '/home/hoffs/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/hoffs/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/hoffs/google-cloud-sdk/completion.zsh.inc'; fi
