#!/bin/bash
#------------------------------#
#        ___                   #
#       /   |_   ____  __      #
#      / /| | | / / / / /      #
#     / ___ | |/ / /_/ /       #
#    /_/  |_|___/\__, /        #
#               /____/         #
#------------------------------#

# Update package lists and install Zsh if not already installed
pkg update
pkg install -y zsh

# Check if zsh is already the default shell
if ! grep -Fxq "exec zsh" ~/.bashrc; then
    echo "Changing the default shell to Zsh (Termux doesn't support chsh)"
    echo "exec zsh" >> ~/.bashrc
fi

echo "Installing Oh My Zsh"
rm -rf ~/.oh-my-zsh/
echo "Removed old Oh My Zsh installation"

RUNZSH=no sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Oh My Zsh installed successfully"

# Download custom .zshrc file before sourcing it
echo "Downloading Custom .zshrc file"
curl "https://raw.githubusercontent.com/OmgAvy/Linux/main/.zshrc" -o ~/.zshrc

# Source the Zsh configuration to apply changes
source ~/.zshrc

echo "Creating Zsh cache and history file"
ZSH_CACHE_DIR=~/.cache/zsh
ZSH_HISTORY_FILE=$ZSH_CACHE_DIR/history

# Ensure cache directory exists
mkdir -p "$ZSH_CACHE_DIR"
touch "$ZSH_HISTORY_FILE"

echo "Downloading .aliases file"
curl "https://raw.githubusercontent.com/OmgAvy/Linux/main/.aliases" -o ~/.aliases

# Set up ZSH_CUSTOM variable
ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
mkdir -p "$ZSH_CUSTOM"

echo "Installing additional plugins"
# zsh-autocomplete
git clone --depth 1 https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete || true

# zsh-you-should-use
git clone --depth 1 https://github.com/MichaelAquilina/zsh-you-should-use.git $ZSH_CUSTOM/plugins/zsh-you-should-use || true

# zsh-autosuggestions
git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions || true

# zsh-syntax-highlighting
git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting || true

# history-substring-search
git clone --depth 1 https://github.com/zsh-users/zsh-history-substring-search.git $ZSH_CUSTOM/plugins/history-substring-search || true

# Remove old Zsh history file if it exists
file_to_remove=~/.zsh_history
if [ -f "$file_to_remove" ]; then
    rm -f "$file_to_remove"
    echo ".zsh_history removed successfully."
else
    echo ".zsh_history file does not exist."
fi

echo "Installing custom vim files"
git clone --depth 1 https://github.com/OmgAvy/Termux.git && \
[ -d "$HOME/Termux/.vim" ] && mv $HOME/Termux/.vim ~/ && rm -rf $HOME/Termux || echo "Error: .vim not found!"

echo "Starting zsh shell ..."
exec zsh
