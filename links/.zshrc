
# sets up oh-my-zsh
source ~/.zsh/oh_my_zsh_settings.sh

# fzf settings
source ~/.zsh/fzf_settings.sh

# all my stuff
source "$HOME/.zsh/ytdl.sh"
source "$HOME/.zsh/functions_and_aliases.sh"

# shell hooks
source ~/.zsh/hooks.sh
source ~/.zsh/util.sh

pfetch

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/hoffs/google-cloud-sdk/path.zsh.inc' ]; then . '/home/hoffs/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/hoffs/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/hoffs/google-cloud-sdk/completion.zsh.inc'; fi
