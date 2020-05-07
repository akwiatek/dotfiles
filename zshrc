# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="custom"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

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

# tmux plugin: Automatically start tmux
export ZSH_TMUX_AUTOSTART=true

# Required by autoenv
autoload -U add-zsh-hook

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=( \
        autoenv \
        dircycle \
        fancy-ctrl-z \
        git \
        git-extra-commands \
        git-extras \
        golang \
        z \
    )
plugins+=($(which \
        gradle          \
        gulp            \
        mvn             \
        ng              \
        npm             \
        sbt             \
        scala           \
        thefuck         \
        tmux            \
        yarn            \
        | sed '/not found$/d;s:.*/::'
    ))

aws_prompt_info() {
    # dummy implementation
}

amend_path_content=''
amend_path () {
    if [ -d "$1" ]; then
        amend_path_content="$amend_path_content:$1"
    fi
}

amend_path '/usr/lib/jvm/default/bin'
amend_path '/opt/node/bin'
amend_path '/opt/gradle/bin'
amend_path '/opt/local/sbin'
amend_path '/opt/local/bin'
amend_path '/usr/local/sbin'
amend_path '/usr/local/bin'
amend_path '/usr/bin/site_perl'
amend_path '/usr/bin/vendor_perl'
amend_path '/usr/bin/core_perl'
amend_path '/usr/sbin'
amend_path '/usr/bin'
amend_path '/sbin'
amend_path '/bin'
amend_path "$(dirname $(readlink -f $(which git)))/share/git/git-jump"
amend_path "$HOME/go/bin"
amend_path "$HOME/.rvm/gems/ruby-2.2.1/bin"
amend_path "$HOME/.rvm/gems/ruby-2.2.1@global/bin"
amend_path "$HOME/.rvm/rubies/ruby-2.2.1/bin"
amend_path "$HOME/.rvm/bin"
amend_path "$HOME/go/bin"
amend_path "$HOME/git-extensions/bin"

# register local git extensions
for ext in ~/src/git-extensions/*
do
    amend_path "$ext"
done

export PATH="${amend_path_content/:}:node_modules/.bin"

unset -f amend_path
unset amend_path_content

source $ZSH/oh-my-zsh.sh

plugins+=(zsh-completions)
autoload -U compinit && compinit
autoload -U zsh-mime-setup && zsh-mime-setup

export EDITOR="$(which vim)"
export VISUAL="$EDITOR"
export FZF_DEFAULT_OPTS='--color=16 --cycle --exact --reverse'
export PAGER=~/.vim/opt/vimpager/vimpager
which lesspipe.sh &> /dev/null && export LESSOPEN='|lesspipe.sh %s'

# TERM inside tmux
[ "$TERM" = 'screen' ] && export TERM=screen-256color
[ "$TERM" = 'xterm' ] && export TERM=xterm-256color

# red foreground color in grep output
export GREP_COLORS='1;31:ln=1;33:fn=1;32'

export ANSIBLE_COW_SELECTION=moose
#export FZF_DEFAULT_COMMAND='find . -type d \( -name .git -o -name node_modules -o -name compiledts -o -name dist -o -name release -o -name reports -o -name bin -o -name build -o -name target -o -name roles -o -name libs -o -name .idea -o -name .idea_modules \) -prune -o -type f -print'
export FZF_DEFAULT_COMMAND='git ls-files'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_TMUX=1
export JSGC_DISABLE_POISONING=1
export MOZ_ACCELERATED=1
export MOZ_WEBRENDER=1

# Treat the ‘#’, ‘~’ and ‘^’ characters as part of patterns for filename generation, etc.
setopt EXTENDED_GLOB
# The pattern ‘**/*’ can be abbreviated to ‘**’ and the pattern ‘***/*’ can be abbreviated to *** .
setopt GLOB_STAR_SHORT
# Append a trailing ‘/’ to all directory names resulting from filename generation (globbing).
setopt MARK_DIRS
# Do print the exit value of programs with non-zero exit status.
setopt PRINT_EXIT_VALUE
# All options are shown, marked ‘on’ / ‘off’.
setopt KSH_OPTION_PRINT
# When writing out the history file, older commands that duplicate newer ones are omitted.
setopt HIST_SAVE_NO_DUPS

bindkey '[D' backward-word
bindkey '[C' forward-word

which docker-machine &> /dev/null && eval "$(docker-machine env 2> /dev/null)"
which gulp           &> /dev/null && eval "$(gulp --completion=zsh)"
which thefuck        &> /dev/null && eval "$(thefuck --alias)"

alias ag='ag --no-heading --color-match="1;31"'
alias rg='rg --no-heading --colors="line:fg:11" --colors="line:style:bold" --colors="path:fg:10" --colors="path:style:bold"'
alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,compiledts,dist,node_modules,reports,bin,build,target,roles,libs,.idea,.idea_modules}'
alias gulp='yarn gulp'
# fzf does not co-operate with 256 color terminals nicely.
alias fzf='TERM=xterm fzf'
alias fzf-tmux='TERM=xterm fzf-tmux'

alias ls='ls --color'

source ~/.fzf.zsh

if [ -r ~/.zshrc.private ]; then
    source ~/.zshrc.private
fi
if [ -r ~/.zsh_aliases ]; then
    source ~/.zsh_aliases
fi
