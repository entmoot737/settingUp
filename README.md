# Configuration Guide

1. ## Switching to zsh
    * Check to see if you have zsh already installed
        ```shell
            zsh --version
        ```
        If you get a version of 4.3.9 or higher, you should be good
    * Make zsh your default shell
        ```shell
             chsh -s $(which zsh)
        ```
        To put bash back as your default shell, just use the same command except 
        switch 'zsh' for 'bash'
        You need to log out and log back in to view these changes

1. ## Install vim and cmake (Use brew to install things on mac)
    * Delete your .zshrc and .vimrc files
        ```shell
            rm .zshrc .vimrc
        ```

1. ## Cloning this repository
    * To download this repository
        ```shell
            git clone https://github.com/Entmoot737/Configurations
        ```

1. ## Installing this repository
    * Navigate into the repository 
    * Add packages into your home directory
        ```shell
            cp -R .vim ~
            cp -R .oh-my-zsh ~
            cp .vimrc ~
            cp .zshrc ~
            cp .gitconfig ~
        ```
    * Copy the Rest of the backup folders to your home directory
    * Install vim packages
        ```shell
            vim .vimrc
            :PlugInstall
            :PluginInstall
            :wq
            cd ~/.vim/plugged/YouCompleteMe
            python3 install.py --all
        ```
    * Configure .zshrc
        ``` zsh
            vim .zshrc
        ```
        Edit the line that contains your username to your computer's

1. ## Installing z
    * To add z functionality:
        ```shell
            git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z
        ```

1. ## Programs and Apps to Install
    * python3
    * pip3
    * pygame
    * Flask
    * matplotlib
    * yfinance
    * Discord
    * Adobe products
    * Microsoft office
    * Firefox
    * Google chrome
    * LockDown Browser
    * Vlc
    * Spotify
    * thinkorswim
    * virtualBox
    * zoom

1. ## Optional: Adding an application to open to Vim (If on Mac)
    * Open Automator
    * Select New Document
    * Click Application
    * Search for 'run applescript' and add it
    * Paste this code
        ```
            on run {input}
               set the_path to POSIX path of input
               set cmd to "vim " & quoted form of the_path
               tell application "System Events" to set terminalIsRunning to exists application process "Terminal"
               tell application "Terminal"
                  activate
                  if terminalIsRunning is true then
                     do script with command cmd
                  else
                     do script with command cmd in window 1
                  end if
               end tell
            end run
        ```
    * Save the file under applications
    * To use, open file with this application by pressing command + i on the file 
