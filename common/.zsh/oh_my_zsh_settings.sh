# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"


# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker mix)
source $ZSH/oh-my-zsh.sh

# get rid of all the crazy default aliases that oh-my-zsh comes with
unalias -a
