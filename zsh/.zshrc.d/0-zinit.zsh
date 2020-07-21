zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting

# Search history using arrow key
zinit light zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Prompt
zinit ice depth=1; zinit light romkatv/powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

zinit ice wait'!0'
zinit light "b4b4r07/enhancd"
