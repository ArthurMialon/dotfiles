export PATH=$HOME/bin:/usr/local/bin:$PATH

source "$HOME/.config/zsh/aliases.zsh"
source "$HOME/.config/zsh/exports.zsh"
source "$HOME/.config/zsh/functions.zsh"

# Source secrets
touch "$HOME/.config/secrets.zsh" && source "$HOME/.config/secrets.zsh"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(git aws zsh-npm-scripts-autocomplete)

source $ZSH/oh-my-zsh.sh

export HOMEBREW_BUNDLE_FILE="$HOME/.config/Brewfile"
export EDITOR=zed

eval "$(starship init zsh)"

export PATH=$PATH:/Users/$USER/.dot

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NPM_TOKEN=""


# Scaleway CLI autocomplete initialization.
# eval "$(scw autocomplete script shell=zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/asap/code/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/asap/code/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/asap/code/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/asap/code/google-cloud-sdk/completion.zsh.inc'; fi

# bun completions
[ -s "/Users/asap/.bun/_bun" ] && source "/Users/asap/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

alias claude-mem='/Users/asap/.bun/bin/bun "/Users/asap/.claude/plugins/marketplaces/thedotmack/plugin/scripts/worker-service.cjs"'
