# shell hooks
source ~/.zsh/hooks.sh

# sets up oh-my-zsh
source ~/.zsh/oh-my-zsh-settings.sh

source ~/code/util/spaceship-prompt/spaceship.zsh

#small hacks and widgets
source ~/.zsh/widgets.sh

# fzf settings
source ~/.zsh/fzf-settings.sh

# =============================================
# GENERAL ALIAS TIME BROTHERS AND SISTERS
# =============================================

alias daisy="du -hs * | sort -hr"
alias cl='clear'

hist() {
 cat ~/.zsh_history | ag $@
}

#######################
# fasd
######################
# cd into directory
alias z='fasd_cd -d'
# open directory in finder
alias o='fasd -a -e open'

# shortcuts
alias rmdl="rm -rf ~/Downloads/*"

# connects to my pi-vpn
alias pi-vpn="sudo openvpn --keepalive 10 60 --config ~/personal/sec/indus.ovpn"


# Merge PDF files
# Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'

# makes a generic tar.gz file for the given folder
tarmake () {
  tar -cvzf "$1.tar.gz" "$1"
}

# found this thing on SO it supposed to extract most things
untar(){
    if [ -f $1 ] ; then
            case $1 in
                    *.tar.bz2)   tar xvjf $1    ;;
                    *.tar.gz)    tar xvzf $1    ;;
                    *.bz2)       bunzip2 $1     ;;
                    *.rar)       unrar x $1     ;;
                    *.gz)        gunzip $1      ;;
                    *.tar)       tar xvf $1     ;;
                    *.tbz2)      tar xvjf $1    ;;
                    *.tgz)       tar xvzf $1    ;;
                    *.zip)       unzip $1       ;;
                    *.Z)         uncompress $1  ;;
                    *.7z)        7z x $1        ;;
                    *)           echo "Unable to extract '$1'" ;;
            esac
    else
            echo "'$1' is not a valid file"
    fi
}


# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"

# Show active network interfaces
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktopicons="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktopicons="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# This should allow me to change the directory that screenshots go to at will
chscreenshotdir() {
    defaults write com.apple.screencapture location $1 &&killall SystemUIServer
}

alias rmtl='rm -rf testlog'

# takes large amount of text wraps it at 80 characters and puts it back into register
alias wrap80="pbpaste | fold -w 80 -s | pbcopy"

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# provide a notification that a long runnning script is complete e.g long_running_script && ding
ding() {
  osascript -e 'display notification "'$1'" with title "'$2'" sound name "Glass"'
}

#fancy ls command
alias l="exa -laFGgh"
alias ls="exa -Fa"

# alias l="ls -laFGgohq"
# alias ls='ls -Fa'
# alias lg='l | grep -i'

alias zource="source ~/.zshrc"

# unmounts my camera and external HD
alias utsp="diskutil umount /Volumes/tsp* |
  diskutil umount /Volumes/Untitled* |
  diskutil umount /Volumes/PMHOME |
  diskutil umount /Volumes/pi_* |
  diskutil umount /Volumes/phone_* |
  diskutil umount /Volumes/camera_* |
  diskutil umount /Volumes/black_*"

alias testdiskdumb="dd if=/dev/zero of=test bs=64k count=16k "

alias e=$EDITOR


# append filename with a string
appendmv() {
    for i in "${@:2}"
    do
        mv $i "$1$i"
    done
}

# docker
# stop the docker daemon
dockerstopdaemon() {
  osascript -e 'quit app "Docker"'
}

# start the docker daemon
alias dockerstartdaemon='open -a Docker'
# stops containers
alias dockerstopc='docker stop $(docker ps -aq)'
# cleans containers
alias dockercleanc='docker rm $(docker ps -aq)'
# cleans volumes
alias dockercleanv='docker volume rm $(docker volume ls --filter dangling=true -q)'
# cleans images
alias dockercleani='docker rmi -f $(docker images -q)'

# removes extra data restart of docker demon will be required
alias dockermojo='rm -rf ~/Library/Containers/com.docker.docker/Data/*'

alias dockernuke='dockerstopc || dockercleanc || dockercleani || dockercleanv'
alias dcm='docker-compose'
alias dcmweb='dcm build && dcm run web'

# getting into and out of
# listed containers and images with ease
drun () {
  docker run -it $1 ${2:-/bin/bash}
}

dexec () {
  docker exec -it $1 ${2:-/bin/bash}
}

dgetimg() {
  docker images | fzf | awk '{print $3}'
}

dgetc() {
  docker ps | fzf | awk '{print $1}'
}

fdrun () {
  drun $(dgetimg) $1
}

fdexec () {
  dexec $(dgetc) $1
}

# git
alias g="git"
alias gco="git checkout"
# get branch name
alias gbn="git rev-parse --abbrev-ref HEAD"

alias gopen="git open origin"
alias gcf="git clean -f -d"

# finds text across all commits, be careful when searching to not use common terms
# useful for searching for code that you knew existed at one point
gsearch() { git log -S$1 -p }

gpoc() { git pull origin $(gbn) --rebase }
gpuc() { git push origin $(gbn) $1 }
gpuc:() { git push origin $(gbn):$1 }
alias gcopybranchname="gbn | tr -d '\r\n' |tee /dev/stderr | pbcopy"
# if working in a repository where the convention is to name prs after branches
alias gcopyprname="gbn | sed -e 's/-/ /g' | tr -d '\r\n' |tee /dev/stderr | pbcopy"

alias gpu="git push origin"
alias gd="git diff"
alias ga="git add"
alias gs="git status"
alias gr="git reset"
alias gf="git fetch"
alias gcm="git commit -m "
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbs='git rebase --skip'
alias gm='git merge'

# I don't trust git stash so sometimes store incomplete work on top of the branch
# in a commit that is always called 'reset me'
alias greset="git add . && git commit -m 'reset me'"
# undoes the previous alias
alias gr1="git reset HEAD~1"

# pretty git log
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# creates a secret gist and copys url
# useful when trying to show some text to someone across the internet. replacement for pastebin
alias gistm='gist -c -s'

# difi is a tool that displays diffs in the browser
alias installdifi='npm install -g diff2html-cli'
alias dif2='diff2html'
# usage: $ gd master | difi
alias difi='diff2html -i stdin -s side'

# diffs your version of the current branch vs the internet's version
# useful with difi to see updated branch on origin
# $ gdo | difi
gdo() {
  local branchname
  branchname=$(gbn)
  git diff "$branchname" "origin/$branchname" $1
}

# write modern javascript in a js file and have it just work
ecma() {
  if hash babel 2>/dev/null; then
    babel  $1 -d .__babel_tmp && node .__babel_tmp/$1 && rm -rf .__babel_tmp
  elif hash yarn 2>/dev/null; then
    yarn babel  $1 -d .__babel_tmp && node .__babel_tmp/$1 && rm -rf .__babel_tmp
  fi
}

genbabelinstall() {
  npm install --save-dev babel-cli babel-core babel babel-preset-env
}

genbabelrc() {
  if [ -e .babelrc ]
  then
      echo "Already Exists."
  else
   echo '{
  "presets": ["env"],
}' > .babelrc
  fi
}

alias enablebin="chmod +x ~/Sync/settings_backup/Mackup/bin/*"

alias pyenvinstall="CPPFLAGS='-I/usr/local/opt/zlib/include' pyenv install -v"

# Ruby/Rails
alias be="bundle exec"
alias b="bundle"

# JS/Ember
alias ya='yarn'
alias nombom='npm cache clear && bower cache clean && rm -rf node_modules bower_components && npm install && bower install'
alias yombomnl='yarn cache clean && bower cache clean && rm -rf node_modules bower_components && yarn install --no-lockfile'
alias yombom='yarn cache clean && bower cache clean && rm -rf node_modules bower_components && yarn install'

alias tree="tree -L 3"

# elixir
alias miex="iex -S mix"
alias tmiex="MIX_ENV=test iex -S mix"
alias ctmiex="MIX_ENV=test mix compile --force && tmiex"
alias mphx="iex -S mix phx.server"
alias mt="mix test"

# POSTGRES
# To have launchd start postgresql now and restart at login:
#   brew services start postgresql
# Or, if you don't want/need a background service you can just run:
#   pg_ctl -D /usr/local/var/postgres start

#################################################
# edits my path and shims for various things
# this resets my path at begining of script so
# any tampering with my path prior to this point
# is purged
#################################################
source ~/.zsh/path-and-shims.sh


# https://github.com/zsh-users/zsh-syntax-highlighting#why-must-zsh-syntax-highlightingzsh-be-sourced-at-the-end-of-the-zshrc-file
source ~/code/util/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source "$HOME/code/util/spaceship-prompt/spaceship.zsh"
export SPACESHIP_CHAR_SYMBOL="-> "

source ~/code/util/zsh-autopair/autopair.zsh

# lsing on my music directory was getting annoying with the default color
export EXA_COLORS="*.mp3=34"