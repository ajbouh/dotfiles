# Incorporate .profile bits
[ -e ~/.profile ] && . ~/.profile

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000000
SAVEHIST=1000000
setopt incappendhistory sharehistory autocd auto_menu

# Emacs-style key bindings.
bindkey -e
# End of lines configured by zsh-newuser-install

# TextMate is the editor of choice.
VISUAL='subl -w'
BG_EDITOR='subl'

# Enable easy colors
autoload -U colors && colors

# Some sane word boundaries.
export WORDCHARS="*?_[]~&;!#$%^(){}<>"

function settitle() { echo -n -e "\033]0;$@\007" }
PROMPT="%{$(settitle %~)%}%{$fg_bold[green]%}»%{$reset_color%} "

# PROMPT="%{$fg[green]%}%m%{$reset_color%}:%{$fg[blue]%}%~%{$reset_color%} %n\$ "
# PROMPT="%{$fg[green]%}%n@%m%{$reset_color%}:%{$fg_bold[blue]%}%~%{$reset_color%} \$ "

# The following lines were added by compinstall

# zstyle ':completion:*' completer _expand
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' menu select=1 _complete _ignored _approximate
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
# zstyle :compinstall filename '/Users/adamb/.zshrc'

alias ls="ls -Gph"

autoload -Uz compinit
compinit
# End of lines added by compinstall

which figlet > /dev/null && figlet -f mini -w $COLUMNS "$USER@$HOST"

export JAVA_HOME=$(cd $(readlink $(which java))/../..; pwd)
