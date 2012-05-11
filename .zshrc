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



# 2010/06/20
export PYTHONPATH=~/lib/python

# 2010/09/12
# http://d.hatena.ne.jp/mig50/20060730/1154269832
PROMPT="%{[32m%}%n@%m%{[35m%}${WINDOW:+[$WINDOW]} %{[33m%}%(4~,%-1~/.../%3~,%~)%{[m%} %# "
RPROMPT='%{[33m%}%h %{[36m%}%T%{[m%}'

# http://d.hatena.ne.jp/jeneshicc/20090224/1235475290
# some more ls aliases
alias ls='ls -G'
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


# http://d.hatena.ne.jp/tkng/20100712/1278896396
# bind Ctrl + left/right as Alt + B/F
bindkey ";5C" forward-word
bindkey ";5D" backward-word

# dont treat this characters as part of word
export WORDCHARS='*?[]~=&;!#$%^(){}<>'

# 2010/11/22
# alternative method of highspeed 200 lines patch
# http://d.hatena.ne.jp/pyopyopyo/20101121/p1
#if [ "$PS1" ] ; then
#           mkdir -m 0700 /sys/fs/cgroup/cpu/user/$$
#           echo $$ > /sys/fs/cgroup/cpu/user/$$/tasks
#fi

# http://www.spinics.net/linux/fedora/fedora-users/msg386262.html
if [ "$PS1" ] ; then
        mkdir -m 0700 -p /cgroup/cpu/user/$$
        echo 1 > /cgroup/cpu/user/$$/notify_on_release
        echo $$ > /cgroup/cpu/user/$$/tasks
fi

# 2011/01/09
# screen
# http://iandeth.dyndns.org/mt/ian/archives/000646.html
alias screen='screen -U -D -RR'

# 2011/02/09
# http://d.hatena.ne.jp/rdera/20100107/1262868778
#ディレクトリスタックに重複して記録しない
#setopt pushd_ignore_dups

# 2011/04/15
# Hadoop Settings
export HADOOP_HOME=${HOME}/lib/hadoop
export HADOOP_CONF_DIR=${HADOOP_HOME}/conf

export HBASE_HOME=${HOME}/lib/hbase
export ZOOKEEPER_HOME=${HOME}/lib/zookeeper
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home
export HIVE_HOME=${HOME}/lib/hive
export HIVE_CONF_DIR=${HIVE_HOME}/conf

export PIG_HOME=${HOME}/lib/pig
export PIG_CLASSPATH=${HADOOP_CONF_DIR}

export M3_HOME=/usr/local/Cellar/maven/3.0.3

export PATH=${PATH}:${HOME}/bin
export PATH=${PATH}:${HOME}/src/depot_tools
export PATH=${PATH}:${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin
export PATH=${PATH}:${HBASE_HOME}/bin
export PATH=${PATH}:${HIVE_HOME}/bin
export PATH=${PATH}:${PIG_HOME}/bin
export PATH=${PATH}:${M3_HOME}/bin
export PATH=${PATH}:/usr/java/default/bin
export PATH=${PATH}:/usr/local/plt/bin
export PATH=${PATH}:/usr/local/dmd/linux/bin
export PATH=${PATH}:/usr/local/share/python
export PATH=${PATH}:/usr/local/texlive/2011/bin/universal-darwin

# 2011/05/16
alias grep='grep --color'

alias ..2='../..'
alias ..3='../../..'
alias ..4='../../../..'
alias ..5='../../../../..'
alias ..6='../../../../../..'

alias git-log-graph='git log --pretty=format:"%h %ar: %s" --graph'
alias git-sdiff='git diff --no-prefix'

export LESS='-R'
export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'

export ANT_HOME=/usr/share/ant

export LD_LIBRARY_PATH=/usr/local/Cellar/protobuf/2.4.1/lib:${LD_LIBRARY_PATH}

export DL=${HOME}/Downloads

if [ -d "${HBASE_HOME}" ]; then
    export HBASE_JAR_PATH=`ls -1 ${HBASE_HOME}/hbase-*[^s].jar`
    export HBASE_LIB_PATH=${HBASE_HOME}/lib
fi

if [ -d "${ZOOKEEPER_HOME}" ]; then
    export ZOOKEEPER_JAR_PATH=`ls -1 ${ZOOKEEPER_HOME}/zookeeper-*.jar`
fi

export HADOOP_CLASSPATH=${HBASE_JAR_PATH}:${HBASE_LIB_PATH}:${ZOOKEEPER_JAR_PATH}:${HADOOP_CLASSPATH}

# virtualenv setting

export VIRTUALENV_USE_DISTRIBUTE=true

if [ -f /usr/local/share/python/virtualenvwrapper.sh ]; then
    export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
    export WORKON_HOME=$HOME/.virtualenvs
    source /usr/local/share/python/virtualenvwrapper.sh
fi
