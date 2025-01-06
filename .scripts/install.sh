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
