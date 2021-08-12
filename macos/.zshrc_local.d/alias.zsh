alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'
alias ls='exa --icons --sort=type'
alias tree='exa --tree'
alias bell='echo "\a"'

alias g='cd ~/src/$(ghq list | fzf || pwd)'

export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/mysql-client/lib"
export CPPFLAGS="-I/usr/local/opt/mysql-client/include"
export PKG_CONFIG_PATH="/usr/local/opt/mysql-client/lib/pkgconfig"
