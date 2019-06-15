# https://github.com/direnv/direnv
eval "$(direnv hook zsh)"

# https://github.com/clvv/fasd
eval "$(fasd --init auto)"

# init thefuck tool
eval $(thefuck --alias)

eval "$(exenv init -)"
eval "$(nodenv init -)"

# needed to install python using pyenv
export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"
export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"
export KEEP_BUILD_PATH=true
