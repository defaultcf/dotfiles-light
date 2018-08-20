export XDG_CONFIG_HOME=~/.config

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt hist_ignore_dups
setopt share_history

setopt appendhistory beep extendedglob nomatch notify
bindkey -e
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit
zstyle ":completion:*" menu select
zstyle ":completion:*" matcher-list "m:{a-z}={A-Z}"

export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

alias vim="nvim"

autoload -U colors && colors
is_clear=1
precmd() {
  [[ $is_clear -eq 0 ]] && echo
  is_clear=0
}
PROMPT="%{$fg_bold[green]%}%~%{$reset_color%}
🌸 ☀️  💎 > "
alias clear="clear; is_clear=1"

# if not in tmux
if [[ ! -n $TMUX ]]; then
  ID=`tmux list-sessions`
  if [[ -z $ID ]]; then # if tmux is not active
    tmux new-session
  elif [[ `tmux list-sessions -F "#{session_attached}"` != 1 ]]; then
    tmux a
  else
    :
  fi
fi

for file in $HOME/.zshrc.d/*
do
  source $file
done
