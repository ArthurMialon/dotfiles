export PATH=$HOME/bin:/usr/local/bin:$PATH

# source
source "$HOME/.config/zsh/aliases.zsh"
source "$HOME/.config/zsh/exports.zsh"
source "$HOME/.config/zsh/functions.zsh"

# Source secrets
touch "$HOME/.config/secrets.zsh" && source "$HOME/.config/secrets.zsh"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(git aws)

source $ZSH/oh-my-zsh.sh

export HOMEBREW_BUNDLE_FILE="$HOME/.config/Brewfile"
export EDITOR=zed

eval "$(starship init zsh)"

export PATH=$PATH:/Users/arthurmialon/.dot
