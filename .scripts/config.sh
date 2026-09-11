#!/usr/bin/env bash
#
# macOS keyboard settings.
# Run once on a new machine: ./.scripts/config.sh
# Log out and back in for these to take effect everywhere.

set -euo pipefail

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

echo "✅ Keyboard settings applied — log out and back in to finish."
