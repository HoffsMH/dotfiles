# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="avit"
export PROMPT_GEOMETRY_SHOW_RPROMPT=false

GEOMETRY_PROMPT_PLUGINS=(git)

# ZSH_THEME="geometry/geometry"

ZSH_THEME="spaceship-prompt/spaceship"
export SPACESHIP_CHAR_SYMBOL="-> "

# ZSH_THEME="lambda-pure"
#ZSH_THEME="bullet-train"
#ZSH_THEME="amuse"
#ZSH_THEME="muse"
#ZSH_THEME="miloshadzic"
#ZSH_THEME="lamda"
#ZSH_THEME="trapd00r"
#ZSH_THEME="sorin"
#ZSH_THEME="miloshadzic"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker mix)

source $ZSH/oh-my-zsh.sh


# get rid of all the crazy default aliases that oh-my-zsh comes with
unalias -a
