# Home binaries
export PATH=$HOME/bin:$PATH

# Pip Binaries
export PATH="$HOME/Library/Python/2.7/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Go
export GOROOT="/usr/local/opt/go/libexec"
export GOPATH="$HOME/git/go-workspace"
export PATH="$GOPATH/bin:$PATH"
export PATH"=$GOROOT/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="bira"

# Hyphen-insensitive completion
HYPHEN_INSENSITIVE="true"

# Manage Oh-My-Zsh plugins with Antigen
source $ZSH/oh-my-zsh.sh
source $(brew --prefix)/share/antigen/antigen.zsh

antigen use oh-my-zsh

# Plugins
antigen bundle git
antigen bundle node
antigen bundle npm
antigen bundle pip
antigen bundle python
antigen bundle osx
antigen bundle powershell
antigen bundle zsh-autosuggestions

# Auto suggesions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=match_prev_cmd
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=blue'

# Editor
export editor vim

# SSH
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Disable autocorrect
unsetopt correct_all

# Vi Mode
bindkey -v
precmd() { RPROMPT="" }
function zle-line-init zle-keymap-select {
   VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
   RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
   zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

export KEYTIMEOUT=1

# Smart history substring autocomplete
source ~/.oh-my-zsh/custom/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Syntax highlighting - keep at the end of zshrc
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
