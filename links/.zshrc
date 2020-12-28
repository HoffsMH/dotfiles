# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# sets up oh-my-zsh
source ~/.zsh/oh_my_zsh_settings.sh

# fzf settings
source ~/.zsh/fzf_settings.sh

# all my stuff
source "$HOME/.zsh/ytdl.sh"
source "$HOME/.zsh/functions_and_aliases.sh"

# path and shims
source "$HOME/.zsh/path_and_shims.sh"

# shell hooks
source ~/.zsh/hooks.sh
source ~/.zsh/util.sh

# export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/yubikey-agent/yubikey-agent.sock"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

export TERM=st-256color

pfetch

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/hoffs/.config/google-cloud-sdk/google-cloud-sdk/path.zsh.inc' ]; then . '/home/hoffs/.config/google-cloud-sdk/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/hoffs/.config/google-cloud-sdk/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/hoffs/.config/google-cloud-sdk/google-cloud-sdk/completion.zsh.inc'; fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

