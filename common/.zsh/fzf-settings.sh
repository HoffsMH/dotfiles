agg() {
  ag --hidden --ignore-dir=".git" -g "" "$1"
}



export FZF_DEFAULT_OPTS='
                  --border
                  --bind "ctrl-y:execute-silent(echo {} | pbcopy)+abort"
                  --preview "(
                      highlight -O ansi -l {} ||
                      rougify {} ||
                      cat {}
                    ) 2> /dev/null | head -500"'

export FZF_DEFAULT_COMMAND='(git ls-tree -r --name-only HEAD ||
  find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
  sed s/^..//) 2> /dev/null'

export FZF_DEFAULT_COMMAND='ag --silent --hidden --ignore-dir=".git" -g "" .'

export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_CTRL_T_OPTS=$FZF_DEFAULT_OPTS
export FZF_CTRL_R_OPTS="--height 40% --reverse --no-preview "

alias af='fzf'
