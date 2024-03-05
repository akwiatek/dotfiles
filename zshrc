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

export COLOR_THEME=dark

# tmux plugin: Automatically start tmux
if [[ -z "$SSH_CONNECTION" && -n "$DISPLAY" ]]; then
        export ZSH_TMUX_AUTOSTART=true
fi

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
        rust \
        z \
        zsh-autosuggestions \
        zsh-completions \
    )
plugins+=($(which \
        gradle          \
        gulp            \
        kubectl         \
        minikube        \
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

source ~/.zsh_path

source $ZSH/oh-my-zsh.sh

autoload -U compinit && compinit
autoload -U zsh-mime-setup && zsh-mime-setup
autoload -U zmv

export EDITOR="$(which nvim)"
export VISUAL="$EDITOR"
which lesspipe.sh &> /dev/null && export LESSOPEN='|lesspipe.sh %s'

# TERM inside tmux
#if [[ $terminfo[colors] == 256 ]]; then
        [ "$TERM" = 'screen' ] && export TERM=screen-256color
        [ "$TERM" = 'xterm' ] && export TERM=xterm-256color
#fi

# red foreground color in grep output
export GREP_COLORS='1;31:ln=1;33:fn=1;32'

export ANSIBLE_COW_SELECTION=moose
export FZF_DEFAULT_OPTS='--cycle --reverse'
export FZF_TMUX_OPTS='-p80%,80%'
export FZF_DEFAULT_COMMAND='git ls-files'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export JSGC_DISABLE_POISONING=1
export MOZ_ACCELERATED=1
export MOZ_WEBRENDER=1
export PAGER='less --quit-if-one-screen'

# IBUS
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

# OpenJDK + Wayland
export _JAVA_AWT_WM_NONREPARENTING=1

# Use fs.watch on the parent directories of included files (yielding a compromise that results in lower CPU usage than pure fs.watchFile but potentially lower accuracy).
export TSC_WATCHFILE=UseFsEventsOnParentDirectory

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
# fzf does not co-operate with 256 color terminals nicely.
alias fzf='TERM=xterm fzf'
alias fzf-tmux='TERM=xterm fzf-tmux'
alias pgformatter='docker run --rm --attach={stdin,stdout,stderr} --interactive darold.net/pgformatter'
alias ls='ls --color'

source ~/.fzf.zsh

if [ -r ~/.zshrc.private ]; then
    source ~/.zshrc.private
fi
if [ -r ~/.zsh_aliases ]; then
    source ~/.zsh_aliases
fi

alias grey-grep="GREP_COLOR='1;30' grep --color=always"
alias red-grep="GREP_COLOR='1;31' grep --color=always"
alias green-grep="GREP_COLOR='1;32' grep --color=always"
alias yellow-grep="GREP_COLOR='1;33' grep --color=always"
alias blue-grep="GREP_COLOR='1;34' grep --color=always"
alias magenta-grep="GREP_COLOR='1;35' grep --color=always"
alias cyan-grep="GREP_COLOR='1;36' grep --color=always"
alias white-grep="GREP_COLOR='1;37' grep --color=always"

PATH="/home/adam/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/adam/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/adam/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/adam/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/adam/perl5"; export PERL_MM_OPT;
