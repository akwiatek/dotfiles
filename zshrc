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
plugins=(git per-directory-history z zsh-navigation-tools)
which bower   &> /dev/null && plugins+=(bower)
which brew    &> /dev/null && plugins+=(brew brew-cask)
which gulp    &> /dev/null && plugins+=(gulp)
which mvn     &> /dev/null && plugins+=(mvn)
which vagrant &> /dev/null && plugins+=(vagrant)

export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:/opt/local/bin:/opt/local/sbin:/Users/adamkw/.rvm/gems/ruby-2.2.1/bin:/Users/adamkw/.rvm/gems/ruby-2.2.1@global/bin:/Users/adamkw/.rvm/rubies/ruby-2.2.1/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/adamkw/.rvm/bin:/Users/adamkw/.rvm/bin:/opt/local/bin:/opt/local/sbin:/usr/local/sbin"
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
#export MAVEN_OPTS='-DsocksProxyHost=127.0.0.1 -DsocksProxyPort=8000 -Dmaven.wagon.http.ssl.insecure=true -Dmaven.wagon.http.ssl.allowall=true'
which vimpager &> /dev/null && export PAGER="$(which vimpager)"

# TERM inside tmux
[ "$TERM" = 'screen' ] && export TERM=screen-256color
[ "$TERM" = 'xterm' ] && export TERM=xterm-256color

setopt extendedglob

bindkey '[D' backward-word
bindkey '[C' forward-word

which jump    &> /dev/null && eval "$(jump shell zsh)"
which thefuck &> /dev/null && eval "$(thefuck --alias)"

if which pandoc &> /dev/null; then
    md2man () {
        pandoc --standalone --from=markdown --to=man $1 | groff -Tutf8 -man | $PAGER
    }
fi
