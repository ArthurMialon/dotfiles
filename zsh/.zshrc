export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(git aws zsh-npm-scripts-autocomplete)

source $ZSH/oh-my-zsh.sh

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000

setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt EXTENDED_HISTORY

# Sourced after oh-my-zsh so these win over plugin-provided definitions.
touch "$HOME/.config/zsh/aliases.zsh" && source "$HOME/.config/zsh/aliases.zsh"
touch "$HOME/.config/zsh/exports.zsh" && source "$HOME/.config/zsh/exports.zsh"
touch "$HOME/.config/zsh/functions.zsh" && source "$HOME/.config/zsh/functions.zsh"

# Source secrets
touch "$HOME/.config/secrets.zsh" && source "$HOME/.config/secrets.zsh"

export HOMEBREW_BUNDLE_FILE="$HOME/.config/Brewfile"
export EDITOR=zed

eval "$(starship init zsh)"

export PATH=$PATH:$HOME/.dot

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/code/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/code/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/code/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/code/google-cloud-sdk/completion.zsh.inc"; fi

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# bun completions
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"
export PATH=$PATH:/Users/asap/.local/bin
