#!/bin/bash

# Installing Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Installing zsh, git, vim, and cmake
brew install zsh git vim cmake

# Changing default shell
chsh -s $(which zsh)

# Removing any current configuration files for vim/zsh
mkdir ~/.old-configs
function moveConfigs() {
    if [ -f "$1" ]
    then
        mv $1 ~/.old-configs
    fi
}
FILE = "~/.hushlogin"
moveConfigs $FILE
FILE = "~/.vim"
moveConfigs $FILE
FILE = "~/.vimrc"
moveConfigs $FILE
FILE = "~/.zsh-plugins"
moveConfigs $FILE
FILE = "~/.zsh-syntax-highlighting"
moveConfigs $FILE
FILE = "~/.histfile"
moveConfigs $FILE
FILE = "~/.zshrc"
moveConfigs $FILE
FILE = "~/.oh-my-zsh"
moveConfigs $FILE
FILE = "~/ohmyzsh"
moveConfigs $FILE

# Adding new configurations
cp .hushlogin ~
cp -R .vim ~
cp .vimrc ~
cp -R .zsh-plugins ~
cp -R .zsh-syntax-highlighting ~
cp .zshrc ~

# Finishing install
source ~/.zshrc
