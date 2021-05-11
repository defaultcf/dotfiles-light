# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export LANG=en_US.UTF-8
export TERM=xterm-256color

setopt interactive_comments

# History
HISTFILE=~/.zsh_history
HISTSIZE=1000 # save hist on memory
SAVEHIST=10000 # save hist on file
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt share_history

# Completion
autoload -Uz compinit && compinit -i
zstyle ":completion:*" menu select
zstyle ":completion:*" matcher-list "m:{a-z}={A-Z}"
autoload -U bashcompinit && bashcompinit

for file in ~/.zshrc.d/*; do
  source $file
done

if [[ -d ~/.zshrc_local.d ]]; then
  for file in ~/.zshrc_local.d/*; do
    source $file
  done
fi
