# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="strug"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(copybuffer z)
plugins+=($(which \
        adb             \
        bower           \
        docker          \
        docker-compose  \
        gradle          \
        gulp            \
        mvn             \
        npm             \
        pip             \
        sbt             \
        scala           \
        thefuck         \
        tmux            \
        vagrant         \
        yarn            \
        2> /dev/null | sed 's:.*/::'
    ))
which git &> /dev/null && plugins+=(git-extra-commands git-extras)

PATH=''

amend_path () {
    [ -d "$1" ] || return
    [ -z "$PATH" ] && PATH="$1" || PATH="$PATH:$1"
}

# /usr/local/opt/coreutils/libexec/gnubin is before /usr/bin so Homebrew GNU bins are preffered over OSX BSD bins
amend_path '/usr/local/opt/coreutils/libexec/gnubin'
amend_path '/usr/lib/jvm/default/bin'
amend_path '/opt/local/sbin'
amend_path '/opt/local/bin'
# /usr/local/bin is before /usr/bin so Homebrew Vim is preffered over OSX Vim
amend_path '/usr/local/sbin'
amend_path '/usr/local/bin'
amend_path '/usr/bin/site_perl'
amend_path '/usr/bin/vendor_perl'
amend_path '/usr/bin/core_perl'
amend_path '/usr/sbin'
amend_path '/usr/bin'
amend_path '/sbin'
amend_path '/bin'
which git &> /dev/null && amend_path "$(dirname $(readlink --canonicalize $(which git)))/share/git/git-jump"
amend_path "$HOME/.rvm/gems/ruby-2.2.1/bin"
amend_path "$HOME/.rvm/gems/ruby-2.2.1@global/bin"
amend_path "$HOME/.rvm/rubies/ruby-2.2.1/bin"
amend_path "$HOME/.rvm/bin"
amend_path "$HOME/git-extensions/bin"

# register local git extensions
for ext in ~/src/git-extensions/*
do
    amend_path "$ext"
done

unset -f amend_path

export PATH

source $ZSH/oh-my-zsh.sh

plugins+=(zsh-completions)
autoload -U compinit && compinit

export EDITOR="$(which vim)"
export VISUAL="$EDITOR"
export FZF_DEFAULT_OPTS='--color=16 --cycle --exact --reverse'
export PAGER=~/.vim/opt/vimpager/vimpager
which lesspipe.sh &> /dev/null && export LESSOPEN='|lesspipe.sh %s'

# TERM inside tmux
[ "$TERM" = 'screen' ] && export TERM=screen-256color
[ "$TERM" = 'xterm' ] && export TERM=xterm-256color

# red background color in grep output
export GREP_COLOR='1;41'

export ANSIBLE_COW_SELECTION=moose
export FZF_DEFAULT_COMMAND='find * -type d \( -name node_modules -o -name dist -o -name release -o -name bower_components -o -name reports -o -name build -o -name target -o -name roles -o -name libs -o -name .idea -o -name .idea_modules \) -prune -o -type f -print'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_TMUX=1

# Treat the ‘#’, ‘~’ and ‘^’ characters as part of patterns for filename generation, etc.
setopt EXTENDED_GLOB
# The pattern ‘**/*’ can be abbreviated to ‘**’ and the pattern ‘***/*’ can be abbreviated to *** .
setopt GLOB_STAR_SHORT
# Append a trailing ‘/’ to all directory names resulting from filename generation (globbing).
setopt MARK_DIRS
# Do not print the exit value of programs with non-zero exit status.
setopt NO_PRINT_EXIT_VALUE
# All options are shown, marked ‘on’ / ‘off’.
setopt KSH_OPTION_PRINT
# When writing out the history file, older commands that duplicate newer ones are omitted.
setopt HIST_SAVE_NO_DUPS

bindkey '[D' backward-word
bindkey '[C' forward-word

which docker-machine &> /dev/null && eval "$(docker-machine env 2> /dev/null)"
which jump           &> /dev/null && eval "$(jump shell zsh)"
which thefuck        &> /dev/null && eval "$(thefuck --alias)"
which pm2            &> /dev/null && eval "$(pm2 completion)"

if which pandoc &> /dev/null; then
    md2man () {
        pandoc --standalone --from=markdown --to=man $1 | groff -Tutf8 -man | $PAGER
    }
fi
weather () {
    curl "http://wttr.in/$1"
}

alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,bower_components,dist,node_modules,reports,build,target,roles,libs,.idea,.idea_modules}'

alias grey-grep="GREP_COLOR='1;30' grep --color=always"
alias red-grep="GREP_COLOR='1;31' grep --color=always"
alias green-grep="GREP_COLOR='1;32' grep --color=always"
alias yellow-grep="GREP_COLOR='1;33' grep --color=always"
alias blue-grep="GREP_COLOR='1;34' grep --color=always"
alias magenta-grep="GREP_COLOR='1;35' grep --color=always"
alias cyan-grep="GREP_COLOR='1;36' grep --color=always"
alias white-grep="GREP_COLOR='1;37' grep --color=always"

alias ls='ls --color'

alias noti='reattach-to-user-namespace noti'

source ~/.fzf.zsh

if [ -r ~/.zshrc.private ]; then
    source ~/.zshrc.private
fi
if [ -r ~/.zsh_aliases ]; then
    source ~/.zsh_aliases
fi
