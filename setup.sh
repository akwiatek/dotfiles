#!/bin/sh

set -e

for_each_dir() {
    local action="$1"
    for d in *; do
        echo "$d"
        cd "$d"
        "$action"
        cd -
    done
}

try_git_pull() {
    if [ -d .git ]; then
        git fetch
        git reset --hard @{u}
    fi
}

try_git_pull_each() {
    for_each_dir try_git_pull
}

safe_cd() {
    local target="$1"
    [ -d "$target" ] || mkdir -p "$target"
    cd "$target"
}

try_git_clone() {
    local url="$1"
    [ -d "$(basename "${url%.git}")" ] || git clone "$url"
}

vim_index_help() {
    ! [ -d docs ] || vim -u NONE -c 'helptags docs' -c quit
}

vim_index_help_each() {
    for_each_dir vim_index_help
}

safe_cd ~/src/git-extensions/
try_git_clone https://github.com/mhagger/git-imerge
try_git_clone https://github.com/tkrajina/git-plus

try_git_pull_each

safe_cd ~/.tmux/plugins/
try_git_clone https://github.com/tmux-plugins/tmux-copycat
try_git_clone https://github.com/tmux-plugins/tpm

try_git_pull_each

cd ~
[ -d .oh-my-zsh ] || sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

safe_cd ~/.oh-my-zsh/custom/plugins/
try_git_clone https://github.com/unixorn/git-extra-commands
try_git_clone https://github.com/zsh-users/zsh-completions

try_git_pull_each

rm -f ~/.zcompdump* || :

if which go &> /dev/null; then
    [ -d ~/.fzf ] || git clone --depth 1 https://github.com/junegunn/fzf ~/.fzf

    safe_cd ~/.fzf/
    git pull
    ./install --completion --key-bindings --no-update-rc
fi

safe_cd ~/.vim/undo/
safe_cd ~/.vim/swaps/

safe_cd ~/.vim/opt/
try_git_clone https://github.com/rkitover/vimpager
try_git_clone https://github.com/tpope/vim-pathogen

try_git_pull_each

if which make &> /dev/null; then
    safe_cd ~/.vim/opt/vimpager/
    make
fi

safe_cd ~/.vim/autoload/
[ -L pathogen.vim ] || ln -s ../opt/vim-pathogen/autoload/pathogen.vim pathogen.vim

safe_cd ~/.vim/bundle/
try_git_clone https://github.com/airblade/vim-gitgutter
try_git_clone https://github.com/alvan/vim-closetag
try_git_clone https://github.com/bronson/vim-trailing-whitespace
try_git_clone https://github.com/craigemery/vim-autotag
try_git_clone https://github.com/ctrlpvim/ctrlp.vim
try_git_clone https://github.com/easymotion/vim-easymotion
try_git_clone https://github.com/flazz/vim-colorschemes
try_git_clone https://github.com/godlygeek/csapprox
try_git_clone https://github.com/godlygeek/tabular
try_git_clone https://github.com/gregsexton/gitv
try_git_clone https://github.com/j5shi/SearchComplete
try_git_clone https://github.com/keith/tmux.vim
try_git_clone https://github.com/mbbill/undotree
try_git_clone https://github.com/mileszs/ack.vim
try_git_clone https://github.com/nathanaelkane/vim-indent-guides
try_git_clone https://github.com/othree/javascript-libraries-syntax.vim
try_git_clone https://github.com/scrooloose/nerdcommenter
try_git_clone https://github.com/scrooloose/nerdtree
try_git_clone https://github.com/scrooloose/syntastic
try_git_clone https://github.com/sheerun/vim-polyglot
try_git_clone https://github.com/skwp/greplace.vim
try_git_clone https://github.com/tpope/vim-abolish
try_git_clone https://github.com/tpope/vim-fugitive
try_git_clone https://github.com/tpope/vim-git
try_git_clone https://github.com/tpope/vim-obsession
try_git_clone https://github.com/tpope/vim-rhubarb
try_git_clone https://github.com/vim-scripts/Align
try_git_clone https://github.com/vim-scripts/argwrap.vim
try_git_clone https://github.com/vim-scripts/camelcasemotion
try_git_clone https://github.com/vim-scripts/JavaDecompiler.vim
try_git_clone https://github.com/vim-scripts/matrix.vim--Yang
try_git_clone https://github.com/vim-scripts/Merginal
try_git_clone https://github.com/vim-scripts/SQLUtilities
try_git_clone https://github.com/vim-scripts/taglist.vim
try_git_clone https://github.com/vim-scripts/The-Old-Ones
try_git_clone https://github.com/vim-scripts/vim-human-dates
try_git_clone https://github.com/vim-scripts/vimagit
try_git_clone https://github.com/Xuyuanp/nerdtree-git-plugin

try_git_pull_each
vim_index_help_each

safe_cd ~/.vim/syntax/
curl --silent --show-error http://www.haproxy.org/download/contrib/haproxy.vim > haproxy.vim
