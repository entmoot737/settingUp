# Installation

1. ## Mac Installation
    1. Install Homebrew
        ```shell
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        ```
    1. Install Dependencies
        ```shell
        brew install git vim cmake zsh npm python
        pip3 install jedi
        ```
    1. Switch default shell to zsh
        ```shell
        chsh -s $(which zsh)
        ```
        After entering this command, restart your terminal session
    1. Download and Install Configuration Files
        ```shell
        git clone https://github.com/Entmoot737/SettingUp
        ```
        If you already have a .vimrc file, a .zshrc file, or a .vim directory, delete or move
        them now
        ```shell
        cd SettingUp
        ```
        ```shell
        cp .vimrc ~
        ```
        ```shell
        cp -R .vim ~
        ```
        ```shell
        cp -R .zsh-plugins ~
        ```
        ```shell
        cp -R .zsh-syntax-highlighting ~
        ```
        ```shell
        cp .zshrc ~
        ```
        ```shell
        cd
        ```
        ```shell
        source .zshrc
        ```
        You can now delete this repository if desired

    1. Create an application to open a file with Vim (Optional)
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

1. ## Linux Installation
    1. Install Dependencies
        * Use your package manager to install:
        * git
        * vim
        * zsh
        * zsh-completions
        * cmake
        * npm
        * python3 
    1. Switch default shell to zsh
        ```shell
        chsh -s $(which zsh)
        ```
        After entering this command, restart your terminal session
    1. Download and Install Configuration Files
        ```shell
        git clone https://github.com/Entmoot737/SettingUp
        ```
        If you already have a .vimrc file, a .zshrc file, or a .vim directory, delete or move
        them now
        ```shell
        cd SettingUp
        ```
        ```shell
        cp .vimrc ~
        ```
        ```shell
        cp -R .vim ~
        ```
        ```shell
        cp -R .zsh-plugins ~
        ```
        ```shell
        cp -R .zsh-syntax-highlighting ~
        ```
        ```shell
        cp .zshrc ~
        ```
        ```shell
        cd
        ```
        ```shell
        source .zshrc
        ```
        You can now delete this repository if desired
