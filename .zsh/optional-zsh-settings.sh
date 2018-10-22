# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"


# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  # export EDITOR='/Applications/Emacs.app/Contents/MacOS/Emacs'
  export EDITORNAME='emacs'
  export EDITOR='open -a "emacs" --args --chdir $PWD "$@"'
  # export EDITOR='atom'
fi

# /Applications/Emacs.app/Contents/MacOS/Emacs "$@"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

defaults write com.sublimetext.3 ApplePressAndHoldEnabled -bool false
git config --global core.editor "subl -n -w"
# defaults write -g ApplePressAndHoldEnabled -bool false
