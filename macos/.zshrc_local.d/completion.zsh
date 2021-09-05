if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

zstyle ':completion:*:*:-command-:*:*' ignored-patterns 'docker-compose-v1'
