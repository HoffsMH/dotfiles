######################################################
# zsh
######################################################

alias zource="source ~/.zshrc"

######################################################
# Disk management
######################################################

daisy() {
    du -hs $@ | sort -hr
}

######################################################
# history
######################################################

hist() {
    cat ~/.zsh_history | ag $@
}

######################################################
# files/directory work
######################################################
alias z='fasd_cd -d'

# lsing on my music directory was getting annoying with the default color
export EXA_COLORS="*.mp3=34"

#fancy ls command
alias l="exa -laFGgh"
alias ls="exa -Fla"

# alias l="ls -laFGgohq"
# alias ls='ls -Fa'
# alias lg='l | grep -i'

alias tree="tree -L 3"

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

# touch that builds path to the file if it doesnt exist
t() {
    if [ $# -lt 1 ]; then
      echo "Missing argument";
      return 1;
    fi

    for f in "$@"; do
      mkdir -p -- "$(dirname -- "$f")"
      touch -- "$f"
    done
}

alias pass="gopass"

######################################################
# git
######################################################
# fuzzy finder for checking out git branchs
gcof() {
    local tags branches target
    tags=$(
        git tag | awk '{print "\x1b[31;1mtag\x1b[m\t" $1}') || return
    branches=$(
        git branch --all | grep -v HEAD             |
            sed "s/.* //"    | sed "s#remotes/[^/]*/##" |
            sort -u          | awk '{print "\x1b[34;1mbranch\x1b[m\t" $1}') || return
    target=$(
        (echo "$tags"; echo "$branches") |
            fzf-tmux -l30 -- --no-hscroll --ansi +m -d "\t" -n 2 --preview-window=hidden
          ) || return
    git checkout $(echo "$target" | awk '{print $2}')
}

alias g="git"
alias gb="git branch"
alias gco="git checkout"
# get branch name
alias gbn="git rev-parse --abbrev-ref HEAD"

alias gopen="git open origin &"
alias gcf="git clean -f -d"

# finds text across all commits, be careful when searching to not use common terms
# useful for searching for code that you knew existed at one point
gsearch() { git log -S$1 -p }
gpoc() { git pull origin $(gbn) --rebase }
gpuc() { git push origin $(gbn) $1 }

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

######################################################
# docker
######################################################
# stops containers
alias dockerstopc='docker stop $(docker ps -aq)'
# cleans containers
alias dockercleanc='docker rm $(docker ps -aq)'
# cleans volumes
alias dockercleanv='docker volume rm $(docker volume ls --filter dangling=true -q)'
# cleans images
alias dockercleani='docker rmi -f $(docker images -q)'

alias dockernuke='dockerstopc || dockercleanc || dockercleani || dockercleanv'

######################################################
# language specific
######################################################
alias pyenvinstall="CPPFLAGS='-I/usr/local/opt/zlib/include' pyenv install -v"

# JS/Ember
alias ya='yarn'

# elixir
alias miex="iex -S mix"
alias miet="iex -S mix test"
alias tmiex="MIX_ENV=test iex -S mix"
alias ctmiex="MIX_ENV=test mix compile --force && tmiex"
alias mphx="iex -S mix phx.server"
alias mt="mix test"
alias be="bundle exec"

# takes large amount of text wraps it at 80 characters and puts it back into register
alias wrap80="xclip -o | fold -w 80 -s | xclip -selection clipboard"

export ytgo_template_location="$HOME/personal/dotfiles/samples/bin/ytgo"
export ytgo_location="$HOME/bin/ytgo"

alias ytreport='cat $ytgo_location'
alias ytsubl='subl3 ~/bin/ytgo'
alias pacman-refresh='sudo pacman-mirrors -f && sudo pacman -Syyu'

######################################################
# media
######################################################

# looping play
alias play="mpv --no-audio-display --loop-playlist"

# looping play with no video even if there is video
alias playa="mpv -vo=null --no-audio-display --loop-playlist"

# looping play with video even if there is no video
alias playv="mpv --no-audio-display --loop-playlist"

######################################################
# clipboard
######################################################

# cptext bash script for copying text arguments
alias xpaste="xclip -o"
alias xclip="/usr/bin/xclip -selection clipboard"

######################################################
# history
######################################################

# puts a fuzzy found history command in buffer
fh() {
    local seshist=$([ -n "$ZSH_NAME" ] && fc -l 1 || history)
    local zshhist=$(cat ~/.zsh_history)

    # linux needs -r
    print -z $(echo $zshhist $seshist | fzf +s --tac | sed -r 's/( *: *[0-9]*:0;\*? *)|( *[0-9]*\*? *)//' | sed -r 's/\\/\\\\/g')
}

# copies history commend to clipboard
fhl() {
  local seshist=$([ -n "$ZSH_NAME" ] && fc -l 1 || history)
  local zshhist=$(cat ~/.zsh_history)

  # linux needs -r
  cptext $(echo $zshhist $seshist | fzf +s --tac | sed -r 's/( *: *[0-9]*:0;\*? *)|( *[0-9]*\*? *)//' | sed -r 's/\\/\\\\/g')
}

######################################################
# disks
######################################################
# unmounts my camera and external HD and anything else I can think of
alias utsp="sudo umount /mnt/tsp* |
  sudo umount /mnt/Untitled* |
  sudo umount /mnt/PMHOME |
  sudo umount /mnt/pi_* |
  sudo umount /mnt/phone_* |
  sudo umount /mnt/camera_* |
  sudo umount /mnt/black_*"

alias rm='echo "This is not the command you are looking for."; false'
alias trm='tl rm'

######################################################
# files
######################################################

alias open="xdg-open"
alias sucap="subl ~/personal/00-capture/capture.md"
alias jf='TERM=kitty SHELL=~/bin/r.shell ranger'
alias jfc='jf ~/personal/00-capture'
alias jfa='jf ~/personal/media/audio'
alias jfi='jf ~/personal/media/image'
alias jfs='jf ~/personal/media/software'
alias jfs='jf ~/personal/media/text'
alias jfv='jf ~/personal/media/video'

# open this file
alias oalias="subl ~/.zsh/functions_and_aliases.sh"

######################################################
# docker
######################################################
# start the docker daemon
alias dockerstartdaemon='sudo systemctl stop docker.service'

# docker
# stop the docker daemon
alias dockerstopdaemon='sudo systemctl start docker.service'

alias task='taskell "$HOME/personal/00-capture/board/taskell.md"'

######################################################
# Text Editing
######################################################
alias sublr="subl3"
alias subl='\rm -rf ~/.config/sublime-text-3/Local/Auto\ Save\ Session.sublime_session && subl3'

######################################################
# getting random text for passwords and secrets
######################################################

random_key() {
  cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w ${1:-32} | head -n 1
}

######################################################
# Displays/wallpaper and keyboard
######################################################

setdmonpicale() {
  xrandr --output $1 --scale $2
}

setdp1cale() {
  setdmonpicale "DisplayPort-1" $1
}

sethdmiscale() {
  setdmonpicale "HDMI-0" $1
}

alias kbdxcape="xcape -t 200 -e Control_L=Escape"
alias kbdsetup="xmodmap ~/.Xmodmap && echo 'xmodmap' \
 || xset r rate 200 30 && echo 'xset rate' \
 || xcape -t 200 -e Control_L=Escape && echo 'xcape' "

######################################################
# WM and session
######################################################

alias xfcesesh="export SESSION=xfce4-session && startx"
alias dwmsesh="export SESSION=dwm && startx"
alias bspwmsesh="export SESSION=bspwm && startx"

# rofi
alias reloadrofi="rofi -dmenu -config $HOME/rofi/config.rasi"

######################################################
# bw
######################################################

bwunlock() {
  export BW_SESSION=$(bw unlock --raw)
}

bwget() {
  pushd ~
  tl bw  $@ | xclip && echo "done"
  popd
}

gpgstart() {
  gpgconf --launch gpg-agent
}

alias gpg-reload-card='gpg-connect-agent "scd serialno" "learn --force" /bye'
alias gpg-import-my-key='curl mhkr.io/key.pub | gpg --import'

alias addoath="ykman oath add -t $1 $(xclip -o)"

######################################################
# ricing
######################################################

alias polybar-workflow='exa ~/personal/dotfiles/links/.config/polybar/config/polybarconfig| entr polybar-msg cmd restart'

######################################################
# searching
######################################################

alias ag="ag $* --pager 'less -R' -A 3 -B 3 --hidden"

######################################################
# Time
######################################################

settime() {
  sudo ntpd -qg
  sudo timedatectl set-timezone "$(curl --fail https://ipapi.co/timezone)"
  sudo hwclock -w
}

######################################################
# network sleuthing
######################################################

alias nmapo="sudo nmap -O -v"


######################################################
# Restic and backup stuff
######################################################

# specify your repo with env variable or -r
alias resticbrowse="restic mount /media/restic"

#######################
# grrrrr
#######################

alias mkup="sudo rm -fr ./tmp && make up"
alias rmup="sudo rm -fr ./tmp && make up"

######################################################
# INFO
######################################################

alias deviceinfo='sudo dmidecode | ag --pager cat -A 9 -B 0 "System Information"'

compressdisk() {
  sudo dd if=$1 status=progress conv=sparse | gzip -c > ~/personal/media/software/capture/$(basename $1).img.gz
}
compressedimgtodisk() {
  gzip -cd < $1| sudo dd of=$2 status=progress
}

######################################################
# PASS
######################################################

alias passedit='pass edit -e "$EDITOR --wait"'
alias passc="pass show -c"

alias gcor='git checkout links/.config/ranger'
