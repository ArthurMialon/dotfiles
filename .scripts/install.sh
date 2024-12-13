#!/usr/bin/env bash

###############################################################################
# Setup basics
###############################################################################

NAME="arthurmialon"
BASE_DIR=$(dirname "$0")
echo "$BASE_DIR"

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

# Let's do it !
echo "\n ${green}Setting up your Mac...${reset}"

###############################################################################
# XCode Command Line Tools
# thanks to https://github.com/nicksp/dotfiles/blob/master/setup-new-machine.sh
###############################################################################
if ! xcode-select --print-path &> /dev/null; then

  # Prompt user to install the XCode Command Line Tools
  xcode-select --install &> /dev/null

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Wait until the XCode Command Line Tools are installed
  until xcode-select --print-path &> /dev/null; do
    sleep 5
  done

  print_result $? 'Install XCode Command Line Tools'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Point the `xcode-select` developer directory to
  # the appropriate directory from within `Xcode.app`
  # https://github.com/alrra/dotfiles/issues/13

  sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer
  print_result $? 'Make "xcode-select" developer directory point to Xcode'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Prompt user to agree to the terms of the Xcode license
  # https://github.com/alrra/dotfiles/issues/10

  sudo xcodebuild -license
  print_result $? 'Agree with the XCode Command Line Tools licence'

fi
###############################################################################

####################################
#  BREW
####################################

# Install app and binaries
echo "\n ${green}Install app and binairies...${reset}"

## Check for Homebrew and install if we don't have it
echo "\n ${green}Install Homebrew...${reset}"
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

brew update

####################################
#  Git & ZSH
####################################

echo "\n ${green}Install Git & ZSH...${reset}"
brew install git zsh

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

####################################
#  Dot CLI
####################################

# Install Dot CLI to manage dotfiles
echo "\n ${green}Install Dot CLI...${reset}"
if test ! $(which dot); then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/arthurmialon/dot/main/install.sh)"
fi

echo "\n ${green}Setup your dotfiles...${reset}"

# Make sure with have Dot CLI in our current PATH
touch $HOME/.zshrc
source $HOME/.zshrc

# Create code directory
mkdir -p $HOME/code/$NAME/
cd $HOME/code/$NAME/

dot init https://github.com/$NAME/dotfiles.git

# (re)source with out configuration
source ~/.zshrc

echo "\n ${green}Install your dependencies.with Brew bundle..${reset}"

brew tap homebrew/bundle
brew bundle

echo "\n 💪 ${green} Done...${reset}"
