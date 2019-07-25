######################################################
# zsh
######################################################
alias zource="source ~/.zshrc"

######################################################
# misc
######################################################
alias cl='clear'

task() {
    pushd $HOME/personal/01-schedule/board
    taskell
    popd
}

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

# append filename with a given string
# appendmv prefix file => new file called prefixfile
appendmv() {
    for i in "${@:2}"
    do
        mv $i "$1$i"
    done
}

selectdir() {
    local dir
    local realdir

    cd ${1:-.} \
        && dir=$(find . -path '*/\.*' -prune \
                      -o -type d -print 2> /dev/null | fzf --no-preview +m) \
        && realdir="$(realpath $dir)" \
        && popd > /dev/null \
        && echo "$realdir"
}

printdirs() {
    find $@ -type d -printf '%d\t%P\n'| sort -r -nk1 | cut -f2- | sed /.git/d | sed /.stfolder/d
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
alias tmiex="MIX_ENV=test iex -S mix"
alias ctmiex="MIX_ENV=test mix compile --force && tmiex"
alias mphx="iex -S mix phx.server"
alias mt="mix test"
alias be="bundle exec"
