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

vim_update_coc() {
    vim -u NONE -c CocUpdate -c quit
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
try_git_clone https://github.com/alvan/vim-closetag
try_git_clone https://github.com/aserebryakov/filestyle
try_git_clone https://github.com/christoomey/vim-conflicted
#try_git_clone https://github.com/craigemery/vim-autotag
try_git_clone https://github.com/ctrlpvim/ctrlp.vim
try_git_clone https://github.com/DavidEGx/ctrlp-smarttabs
try_git_clone https://github.com/dense-analysis/ale
try_git_clone https://github.com/dominikduda/vim_current_word
try_git_clone https://github.com/dylon/vim-antlr
try_git_clone https://github.com/easymotion/vim-easymotion
try_git_clone https://github.com/fatih/vim-go
try_git_clone https://github.com/FelikZ/ctrlp-py-matcher
try_git_clone https://github.com/flazz/vim-colorschemes
try_git_clone https://github.com/FooSoft/vim-argwrap
try_git_clone https://github.com/godlygeek/csapprox
try_git_clone https://github.com/godlygeek/tabular
try_git_clone https://github.com/google/vim-searchindex
try_git_clone https://github.com/gregsexton/gitv
try_git_clone https://github.com/idanarye/vim-merginal
try_git_clone https://github.com/ivalkeen/vim-ctrlp-tjump
try_git_clone https://github.com/j5shi/SearchComplete
try_git_clone https://github.com/akwiatek/ctrlp-cmatcher
try_git_clone https://github.com/jeetsukumaran/vim-markology
try_git_clone https://github.com/jreybert/vimagit
try_git_clone https://github.com/majutsushi/tagbar
try_git_clone https://github.com/mbbill/undotree
try_git_clone https://github.com/mileszs/ack.vim
try_git_clone https://github.com/nathanaelkane/vim-indent-guides
try_git_clone https://github.com/ompugao/ctrlp-history
try_git_clone https://github.com/othree/javascript-libraries-syntax.vim
try_git_clone https://github.com/prettier/vim-prettier
try_git_clone https://github.com/romgrk/winteract.vim
try_git_clone https://github.com/scrooloose/nerdcommenter
try_git_clone https://github.com/scrooloose/nerdtree
try_git_clone https://github.com/scrooloose/syntastic
try_git_clone https://github.com/sgur/ctrlp-extensions.vim
try_git_clone https://github.com/sheerun/vim-polyglot
try_git_clone https://github.com/Shougo/vimproc.vim
try_git_clone https://github.com/skwp/greplace.vim
try_git_clone https://github.com/sodapopcan/vim-twiggy
try_git_clone https://github.com/terryma/vim-expand-region
try_git_clone https://github.com/tpope/vim-abolish
try_git_clone https://github.com/tpope/vim-fugitive
try_git_clone https://github.com/tpope/vim-git
try_git_clone https://github.com/tpope/vim-obsession
try_git_clone https://github.com/tpope/vim-rhubarb
try_git_clone https://github.com/tpope/vim-speeddating
try_git_clone https://github.com/tpope/vim-surround
try_git_clone https://github.com/vim-scripts/Align
try_git_clone https://github.com/vim-scripts/camelcasemotion
try_git_clone https://github.com/vim-scripts/JavaDecompiler.vim
try_git_clone https://github.com/vim-scripts/matchit.zip
try_git_clone https://github.com/vim-scripts/SQLUtilities
try_git_clone https://github.com/vim-scripts/taglist.vim
try_git_clone https://github.com/vim-scripts/The-Old-Ones
try_git_clone https://github.com/vim-scripts/vim-human-dates
try_git_clone https://github.com/whatever555/npm-package-info
try_git_clone https://github.com/Xuyuanp/nerdtree-git-plugin
try_git_clone https://github.com/ycm-core/YouCompleteMe

try_git_clone https://sanctum.geek.nz/code/vim-insert-suspend-hlsearch.git

try_git_pull_each

if ! [ -d coc.nvim-release ]; then
    curl --location https://github.com/neoclide/coc.nvim/archive/release.tar.gz | tar xzfv -
fi

vim_index_help_each
vim_update_coc

if which make &> /dev/null; then
    safe_cd ~/.vim/opt/vimpager/
    make vimpager vimcat
    safe_cd ~/.vim/bundle/vimproc.vim/
    make

    safe_cd ~/src/pspg/
    ./configure
    make
fi

safe_cd ~/.vim/bundle/ctrlp-cmatcher/
git checkout --track origin/python3 || git checkout python3
./install.sh

safe_cd ~/.vim/bundle/YouCompleteMe/
git submodule update --init --recursive
./install.py --go-completer

safe_cd ~/
curl --silent --show-error 'https://www.gitignore.io/api/vim,sbt,node,ruby,java,scala,linux,maven,gradle,angular,libreoffice,intellij+all,intellij+iml,visualstudiocode' > .gitignore_global
cat "$SCRIPT_DIR/gitignore_custom" >> .gitignore_global

echo 'Done.'
