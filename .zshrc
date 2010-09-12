#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#

autoload -U compinit
compinit

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

## history
setopt APPEND_HISTORY

## never ever beep ever
setopt NO_BEEP

## automatically decide when to page a list of completions
#LISTMAX=0

# autoload -U colors
#colors

# 2008/12/20
# history settings
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data 

# emacs keybind
bindkey -e

# auto cd
setopt auto_cd

# directory history
setopt auto_pushd

# correct commands
setopt correct

# pack completion candidate
setopt list_packed

# predict
autoload predict-on
predict-on

# colored ls completion 
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# 2008/12/14
#ping -c 1 -w 1 192.168.0.1 &> /dev/null
#if [ 0 -eq $? -a 0 -eq `ps aux | grep synergy | grep -v grep | wc -l` ];
#then
#         synergyc -f 192.168.0.1 &
#fi

# 2009/01/24
alias xhtags='htags -gsanohITv'

# 2009/07/12
# 2010/05/11 add depot_tools
# 2010/08/02 Sun Java
export PATH=/usr/java/default/bin:${PATH}:/usr/local/plt/bin:/usr/local/dmd/linux/bin:~/src/depot_tools


# 2010/06/20
export PYTHONPATH=~/lib/python

# 2010/09/12
# http://d.hatena.ne.jp/mig50/20060730/1154269832
PROMPT="%{[32m%}%n@%m%{[35m%}${WINDOW:+[$WINDOW]} %{[33m%}%(4~,%-1~/.../%3~,%~)%{[m%} %# "
RPROMPT='%{[33m%}%h %{[36m%}%T%{[m%}'

# http://d.hatena.ne.jp/jeneshicc/20090224/1235475290
# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
