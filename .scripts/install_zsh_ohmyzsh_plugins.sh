#!/bin/bash
#------------------------------#
#        ___                   #
#       /   |_   ____  __      #
#      / /| | | / / / / /      #
#     / ___ | |/ / /_/ /       #
#    /_/  |_|___/\__, /        #
#               /____/         #
#------------------------------#

echo "Creating Zsh cache and history file"
ZSH_CACHE_DIR=~/.cache/zsh
ZSH_HISTORY_FILE=$ZSH_CACHE_DIR/history

# Check if ~/.cache/zsh directory exists, if not, create it
if [ ! -d "$ZSH_CACHE_DIR" ]; then
    mkdir -p "$ZSH_CACHE_DIR"
fi
# Check if ~/.cache/zsh/history file exists, if not, create it
if [ ! -f "$ZSH_HISTORY_FILE" ]; then
    touch "$ZSH_HISTORY_FILE"
fi

echo "Downloading .aliases file"
curl "https://raw.githubusercontent.com/OmgAvy/Linux/main/.aliases" -o ~/.aliases


# Set up ZSH_CUSTOM variable
ZSH_CUSTOM=$HOME/.oh-my-zsh/custom

# Create directory if it doesn't exist
if [ ! -d "$ZSH_CUSTOM" ]; then
    mkdir -p "$ZSH_CUSTOM"
fi

echo "Installing additional plugins"
# zsh-autocomplete
rm -rf $ZSH_CUSTOM/plugins/zsh-autocomplete
git clone --depth 1 https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete || true

# zsh-you-should-use
rm -rf $ZSH_CUSTOM/plugins/zsh-you-should-use
git clone --depth 1 https://github.com/MichaelAquilina/zsh-you-should-use.git $ZSH_CUSTOM/plugins/zsh-you-should-use || true

# zsh-autosuggestions
rm -rf $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions || true

# zsh-syntax-highlighting
rm -rf $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting || true

# history-substring-search
rm -rf $ZSH_CUSTOM/plugins/history-substring-search
git clone --depth 1 https://github.com/zsh-users/zsh-history-substring-search.git $ZSH_CUSTOM/plugins/history-substring-search || true

# Add the plugins to the Zsh configuration file
# plugins=(
#   git
#   npm
#   sudo
#   history
#   zsh-autosuggestions
#   zsh-syntax-highlighting
#   history-substring-search
#   zsh-you-should-use
#   auto-notify
#   zsh-autocomplete
# )

# echo "plugins=(${plugins[@]})" >> ~/.zshrc

file_to_remove=~/.zsh_history
if [ -f "$file_to_remove" ]; then
    rm -f "$file_to_remove"
    echo ".zsh_history removed successfully."
else
    echo ".zsh_history file does not exist."
fi

echo "Downloading Custom .zshrc file" 
curl "https://raw.githubusercontent.com/OmgAvy/Linux/main/.zshrc" -o ~/.zshrc

# echo "Applying changes to zsh configuration"
# source ~/.zshrc

echo "Please restart terminal, Plugins have been successfully installed."

