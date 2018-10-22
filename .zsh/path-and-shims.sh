export PATH=""
export PATH=/bin:$PATH
export PATH=/sbin:$PATH
export PATH=/usr/sbin:$PATH
export PATH=/usr/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=/usr/local/opt/fzf/bin:$PATH

# languages
export PATH=$HOME/.nodenv/bin:$PATH
export PATH=$HOME/.nodenv/shims:$PATH

export PATH=$HOME/.rbenv/shims:$HOME/.rvm/bin:$PATH

export PATH=$HOME/.exenv/bin:$PATH
export PATH=$HOME/.pyenv/bin:$PATH
export PATH=$HOME/.pyenv/shims:$PATH

export PATH=/usr/local/go/bin:$PATH
export GOPATH=$HOME/code/unpaid/go
export GOBIN=$HOME/code/unpaid/go/bin/

eval "$(exenv init -)"
nodenv rehash
rbenv rehash
exenv rehash

# should end up with something like

# /Users/<user>/.rbenv/shims:
# /Users/<user>/.rvm/bin:
# /Users/<user>/.nodenv/shims:
# /Users/<user>/.nodenv/bin:
# /Users/<user>/bin:
# /usr/local/bin:
# /usr/bin:
# /usr/sbin:
# /sbin:
# /bin:
# :
# /usr/local/opt/fzf/bin
