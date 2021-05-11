shopt -s autocd
shopt -s expand_aliases
shopt -s checkwinsize
xhost +local:root > /dev/null 2>&1
complete -cf sudo

HISTSIZE=1000
HISTFILESIZE=10000
shopt -s histappend
export HISTCONTROL=ignoredups:erasedups

stty -ixon
set -o vi
bind -m vi-insert "\C-l":clear-screen #enable Ctrl+L, necessary for vi mode
eval $(dircolors "$XDG_CONFIG_HOME"/dircolors)

export PS1="\[\e[0;31m\][\[\e[m\]\[\e[33m\]\u\[\e[m\]\[\e[93m\]@\[\e[m\]\[\e[1;32m\]\h\[\e[m\] \[\e[36m\]\W\[\e[m\]\[\e[34m\]]\[\e[m\]\[\e[35m\]\\$ \[\e[m\]"

alias cp="cp -i"
alias df='df -h'
alias free='free -m'
alias ls='ls --color=auto --group-directories-first'
alias la="ls -a"
alias ll="ls -lh"
alias grep='grep --colour=auto'
alias audio="youtube-dl -x -f bestaudio/best"
alias video="youtube-dl -f bestvideo+bestaudio"
alias r="R"
alias f="feh -."
alias v="vim"
alias o="xdg-open"
alias sys="inxi -F"
alias oc="o ~/Documents/books/The\ C\ Programming\ Language\ -\ Kernighan\,\ Ritchie.pdf"
