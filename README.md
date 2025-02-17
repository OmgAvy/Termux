# ZSH, OhMyZsh & Vim Setup Guide for Termux
For Personal Use Only

## Installing Zsh and OhMyZsh on Ubuntu

### Install zsh, ohmyzh, vim and their plugins 
```
wget -qO- https://raw.githubusercontent.com/OmgAvy/Termux/main/zsh_vim_plugins.sh | bash
```

### **Method 1**: Direct Paste on the Terminal
For the most straightforward installation, copy and paste the following commands directly into your terminal:
```bash
bash -c $(wget -O- https://raw.githubusercontent.com/OmgAvy/Termux/main/.scripts/install_zsh_ohmyzsh.sh)
```
For those using 'curl' package, use the command '''curl -fsSL'''. 
For additional plugins, use the following:

```bash
bash -c "$(wget -O- https://raw.githubusercontent.com/OmgAvy/Termux/main/.scripts/install_zsh_ohmyzsh_plugins.sh)"
```


### **Method 2**: Offline Installation
If you prefer an offline installation, download the scripts and execute them locally:
Make sure to give execute permissions to the downloaded scripts before running them. 
```bash
chmod +x .scripts/install_zsh_ohmyzsh.sh .scripts/install_zsh_ohmyzsh_plugins.sh
```
```bash
.scripts/install_zsh_ohmyzsh.sh
```

```bash
.scripts/install_zsh_ohmyzsh_plugins.sh
```

## Vim-Dot files Intallation 
Credits - [Majixed](https://github.com/Majixed/vim-dotfiles)
```bash
git clone --depth 1 https://github.com/OmgAvy/Termux.git && mv Termux/.vim ~/ && rm -rf Termux
```

This guide helps enhance your Ubuntu environment with Vim, Zsh and Oh My Zsh for an improved terminal experience.

