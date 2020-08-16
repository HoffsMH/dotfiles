export PATH=""
export PATH=/bin:$PATH
export PATH=/sbin:$PATH
export PATH=/usr/sbin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=/usr/local/opt/fzf/bin:$PATH

# languages
export PATH=$ASDF_DATA_DIR/shims:$PATH

export PATH=/usr/local/go/bin:$PATH
export GOPATH=$HOME/code/go
export GOBIN=$HOME/code/go/bin


# rust env
export PATH="$HOME/.cargo/bin:$PATH"

# openssl on path
export PATH="/usr/local/opt/openssl/bin:$PATH"


# should end up with something like
# ie always prefer version management over system

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
