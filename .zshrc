# Entmoot737's .zshrc file

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
bindkey -v

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vi'
fi

# Completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# End Completion

# Prompt ZSH
PROMPT='%F{028}%n%f in %F{094}%~%f $ '

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{red}(%b)%r%f'
zstyle ':vcs_info:*' enable git

#autoload -Uz promptinit
#promptinit
# End Prompts

# Add Aliases here
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias md='mkdir -p'
alias rd='rmdir'
alias l='ls -AG'
alias g++='g++ -std=c++17'
# End Aliases

# Adding New colors for ls -G output
export LSCOLORS=GxDxcxdxFxegedabagacad
# Ending new colors section

# Plugins
source ~/.zsh-plugins/zsh-z.plugin.zsh
source ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# End Plugins
