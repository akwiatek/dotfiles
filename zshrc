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
plugins=(git z zsh-navigation-tools)
which bower   &> /dev/null && plugins+=(bower)
which brew    &> /dev/null && plugins+=(brew brew-cask)
which gulp    &> /dev/null && plugins+=(gulp)
which mvn     &> /dev/null && plugins+=(mvn)
which thefuck &> /dev/null && plugins+=(thefuck)
which vagrant &> /dev/null && plugins+=(vagrant)

export PATH=""
export PATH="$PATH:/usr/local/opt/coreutils/libexec/gnubin"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/opt/local/sbin"
export PATH="$PATH:/opt/local/bin"
export PATH="$PATH:~/.rvm/gems/ruby-2.2.1/bin"
export PATH="$PATH:~/.rvm/gems/ruby-2.2.1@global/bin"
export PATH="$PATH:~/.rvm/rubies/ruby-2.2.1/bin"
export PATH="$PATH:/usr/sbin"
export PATH="$PATH:/usr/bin"
export PATH="$PATH:/sbin"
export PATH="$PATH:/bin"
export PATH="$PATH:~/.rvm/bin"
export PATH="$PATH:/opt/local/bin"
export PATH="$PATH:/opt/local/sbin"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/opt/local/bin"

# register local git extensions
for ext in ~/src/git-extensions/*
do
    export PATH=$PATH:$ext
done

source $ZSH/oh-my-zsh.sh

plugins+=(zsh-completions)
autoload -U compinit && compinit

export EDITOR="$(which vim)"
export VISUAL="$EDITOR"
which vimpager &> /dev/null && export PAGER="$(which vimpager)"
which lesspipe.sh &> /dev/null && export LESSOPEN='|lesspipe.sh %s'

# TERM inside tmux
[ "$TERM" = 'screen' ] && export TERM=screen-256color
[ "$TERM" = 'xterm' ] && export TERM=xterm-256color

# red background color in grep output
export GREP_COLOR='1;41'

setopt extendedglob

bindkey '[D' backward-word
bindkey '[C' forward-word

which jump    &> /dev/null && eval "$(jump shell zsh)"
which thefuck &> /dev/null && eval "$(thefuck --alias)"
which pm2     &> /dev/null && eval "$(pm2 completion)"

if which pandoc &> /dev/null; then
    md2man () {
        pandoc --standalone --from=markdown --to=man $1 | groff -Tutf8 -man | $PAGER
    }
fi

alias grey-grep="GREP_COLOR='1;30' grep --color=always"
alias red-grep="GREP_COLOR='1;31' grep --color=always"
alias green-grep="GREP_COLOR='1;32' grep --color=always"
alias yellow-grep="GREP_COLOR='1;33' grep --color=always"
alias blue-grep="GREP_COLOR='1;34' grep --color=always"
alias magenta-grep="GREP_COLOR='1;35' grep --color=always"
alias cyan-grep="GREP_COLOR='1;36' grep --color=always"
alias white-grep="GREP_COLOR='1;37' grep --color=always"
