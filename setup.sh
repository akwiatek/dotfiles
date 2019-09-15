#!/bin/zsh

set -e

for_each_dir() {
    local action="$1"
    for d in *; do
        echo "$d"
        if [ -d "$d" ]; then
            cd "$d"
            "$action"
            cd -
        fi
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
    ! [ -d doc ] || vim -u NONE -c 'helptags doc' -c quit
}

vim_index_help_each() {
    for_each_dir vim_index_help
}

SCRIPT_DIR="$(dirname $(realpath $0))"

safe_cd ~/src/
try_git_clone https://github.com/okbob/pspg

try_git_pull_each

safe_cd ~/src/git-extensions/
try_git_clone https://github.com/mhagger/git-imerge
try_git_clone https://github.com/tkrajina/git-plus

try_git_pull_each

safe_cd ~/.tmux/plugins/
try_git_clone https://github.com/tmux-plugins/tmux-copycat
try_git_clone https://github.com/tmux-plugins/tpm

try_git_pull_each

safe_cd ~/
[ -d .oh-my-zsh ] || sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

safe_cd ~/.oh-my-zsh/custom/plugins/
try_git_clone https://github.com/unixorn/git-extra-commands
try_git_clone https://github.com/zsh-users/zsh-completions
try_git_clone https://github.com/zpm-zsh/autoenv

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

safe_cd ~/.vim/autoload/
[ -L pathogen.vim ] || ln -s ../opt/vim-pathogen/autoload/pathogen.vim pathogen.vim

safe_cd ~/.vim/bundle/
try_git_clone https://github.com/airblade/vim-gitgutter
try_git_clone https://github.com/alvan/vim-closetag
try_git_clone https://github.com/aserebryakov/filestyle
try_git_clone https://github.com/craigemery/vim-autotag
try_git_clone https://github.com/ctrlpvim/ctrlp.vim
try_git_clone https://github.com/dominikduda/vim_current_word
try_git_clone https://github.com/dylon/vim-antlr
try_git_clone https://github.com/easymotion/vim-easymotion
try_git_clone https://github.com/flazz/vim-colorschemes
try_git_clone https://github.com/godlygeek/csapprox
try_git_clone https://github.com/godlygeek/tabular
try_git_clone https://github.com/google/vim-searchindex
try_git_clone https://github.com/gregsexton/gitv
try_git_clone https://github.com/j5shi/SearchComplete
try_git_clone https://github.com/keith/tmux.vim
try_git_clone https://github.com/majutsushi/tagbar
try_git_clone https://github.com/mbbill/undotree
try_git_clone https://github.com/mileszs/ack.vim
try_git_clone https://github.com/nathanaelkane/vim-indent-guides
try_git_clone https://github.com/othree/javascript-libraries-syntax.vim
try_git_clone https://github.com/prettier/vim-prettier
try_git_clone https://github.com/romgrk/winteract.vim
try_git_clone https://github.com/sodapopcan/vim-twiggy
try_git_clone https://github.com/scrooloose/nerdcommenter
try_git_clone https://github.com/scrooloose/nerdtree
try_git_clone https://github.com/scrooloose/syntastic
try_git_clone https://github.com/sheerun/vim-polyglot
try_git_clone https://github.com/Shougo/vimproc.vim
try_git_clone https://github.com/sirver/ultisnips
try_git_clone https://github.com/skwp/greplace.vim
try_git_clone https://github.com/tpope/vim-abolish
try_git_clone https://github.com/tpope/vim-fugitive
try_git_clone https://github.com/tpope/vim-git
try_git_clone https://github.com/tpope/vim-obsession
try_git_clone https://github.com/tpope/vim-rhubarb
try_git_clone https://github.com/tpope/vim-surround
try_git_clone https://github.com/ycm-core/YouCompleteMe
try_git_clone https://github.com/vim-scripts/Align
try_git_clone https://github.com/vim-scripts/argwrap.vim
try_git_clone https://github.com/vim-scripts/camelcasemotion
try_git_clone https://github.com/vim-scripts/JavaDecompiler.vim
try_git_clone https://github.com/vim-scripts/matchit.zip
try_git_clone https://github.com/vim-scripts/matrix.vim--Yang
try_git_clone https://github.com/vim-scripts/Merginal
try_git_clone https://github.com/vim-scripts/SQLUtilities
try_git_clone https://github.com/vim-scripts/taglist.vim
try_git_clone https://github.com/vim-scripts/The-Old-Ones
try_git_clone https://github.com/vim-scripts/tsuquyomi
try_git_clone https://github.com/vim-scripts/vimagit
try_git_clone https://github.com/vim-scripts/vim-human-dates
try_git_clone https://github.com/whatever555/npm-package-info
try_git_clone https://github.com/Xuyuanp/nerdtree-git-plugin

try_git_clone https://sanctum.geek.nz/code/vim-insert-suspend-hlsearch.git

try_git_pull_each
vim_index_help_each

if which make &> /dev/null; then
    safe_cd ~/.vim/opt/vimpager/
    make vimpager vimcat
    safe_cd ~/.vim/bundle/vimproc.vim/
    make

    safe_cd ~/src/pspg/
    ./configure
    make
fi

safe_cd ~/.vim/bundle/YouCompleteMe/
git submodule update --init --recursive
./install.py --clang-completer --ts-completer

safe_cd ~/.vim/syntax/
curl --silent --show-error 'https://www.haproxy.org/download/contrib/haproxy.vim' > haproxy.vim

safe_cd ~/
curl --silent --show-error 'https://www.gitignore.io/api/vim,sbt,java,ruby,node,maven,macos,linux,scala,gradle,eclipse,intellij%2biml,intellij%2ball,libreoffice' > .gitignore_global
cat "$SCRIPT_DIR/gitignore_custom" >> .gitignore_global
