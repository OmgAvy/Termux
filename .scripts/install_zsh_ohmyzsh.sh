#!/bin/bash
#------------------------------#
#        ___                   #
#       /   |_   ____  __      #
#      / /| | | / / / / /      #
#     / ___ | |/ / /_/ /       #
#    /_/  |_|___/\__, /        #
#               /____/         #
#------------------------------#

# Install Zsh
pkg update
pkg install -y zsh

echo "Changing the default shell to Zsh"
chsh -s $(which zsh) $USER

echo "Installing OhMyZsh"
rm -rf ~/.oh-my-zsh/
echo "removed OhMyZsh"

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Downloaded OhMyZsh"

# Source the Zsh configuration to apply changes
source ~/.zshrc

echo "Zsh and Oh My Zsh have been successfully installed."
