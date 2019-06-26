source ~/.fzf.zsh

# brings up fuzzy finder for files
bindkey -s '^[yzff' '^t'

# brings up fuzzy finder for history
bindkey -s '^[yzfh' '^r'

# This will open a fuzzy finder of all my history items and once selected
# will output to current editing buffer so that I can either copy or enter

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

# # touch that builds path to the file if it doesnt exist
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

# attempts to print geneaology of a given image
dc_trace_cmd() {
  local parent=`docker inspect -f '{{ .Parent }}' $1` 2>/dev/null
  declare -i level=$2
  echo ${level}: `docker inspect -f '{{ .ContainerConfig.Cmd }}' $1 2>/dev/null`
  level=level+1
  if [ "${parent}" != "" ]; then
    echo ${level}: $parent
    dc_trace_cmd $parent $level
  fi
}
