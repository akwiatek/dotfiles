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
try_git_clone https://github.com/darold/pgFormatter
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
try_git_clone https://github.com/zsh-users/zsh-autosuggestions
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
try_git_clone https://github.com/tpope/vim-pathogen

try_git_pull_each

safe_cd ~/.vim/autoload/
[ -L pathogen.vim ] || ln -s ../opt/vim-pathogen/autoload/pathogen.vim pathogen.vim

safe_cd ~/.vim/bundle/
try_git_clone https://github.com/akwiatek/ctrlp-cmatcher
try_git_clone https://github.com/alvan/vim-closetag
try_git_clone https://github.com/aserebryakov/filestyle
try_git_clone https://github.com/ConradIrwin/vim-bracketed-paste
try_git_clone https://github.com/christoomey/vim-conflicted
try_git_clone https://github.com/craigemery/vim-autotag
try_git_clone https://github.com/ctrlpvim/ctrlp.vim
try_git_clone https://github.com/DavidEGx/ctrlp-smarttabs
try_git_clone https://github.com/dense-analysis/ale
try_git_clone https://github.com/dominikduda/vim_current_word
try_git_clone https://github.com/dylon/vim-antlr
try_git_clone https://github.com/easymotion/vim-easymotion
try_git_clone https://github.com/farmergreg/vim-lastplace
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
try_git_clone https://github.com/jiangmiao/auto-pairs
try_git_clone https://github.com/jeetsukumaran/vim-markology
try_git_clone https://github.com/jreybert/vimagit
try_git_clone https://github.com/kana/vim-narrow
try_git_clone https://github.com/kana/vim-textobj-indent
try_git_clone https://github.com/kana/vim-textobj-user
try_git_clone https://github.com/machakann/vim-highlightedyank
try_git_clone https://github.com/machakann/vim-swap
try_git_clone https://github.com/majutsushi/tagbar
try_git_clone https://github.com/mbbill/undotree
try_git_clone https://github.com/mhinz/vim-startify
try_git_clone https://github.com/mileszs/ack.vim
try_git_clone https://github.com/nathanaelkane/vim-indent-guides
try_git_clone https://github.com/ompugao/ctrlp-history
try_git_clone https://github.com/othree/javascript-libraries-syntax.vim
try_git_clone https://github.com/prettier/vim-prettier
try_git_clone https://github.com/romgrk/winteract.vim
try_git_clone https://github.com/ruanyl/vim-gh-line
try_git_clone https://github.com/rust-lang/rust.vim
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
try_git_clone https://github.com/wellle/tmux-complete.vim
try_git_clone https://github.com/whatever555/npm-package-info

try_git_clone https://dev.sanctum.geek.nz/code/vim-cursorline-current.git
try_git_clone https://dev.sanctum.geek.nz/code/vim-insert-suspend-hlsearch.git
try_git_clone https://dev.sanctum.geek.nz/code/vim-write-mkpath.git

try_git_pull_each

vim_index_help_each

if which make &> /dev/null; then
    safe_cd ~/src/pspg/
    ./configure
    #make
fi

if which docker &> /dev/null && docker info &> /dev/null; then
    safe_cd ~/src/pgFormatter/
    docker build -t darold.net/pgformatter .
fi

safe_cd ~/.vim/bundle/ctrlp-cmatcher/
git checkout --track origin/python3 || git checkout python3
rm -rf autoload/build || :
./install.sh

safe_cd ~/
curl --silent --show-error 'https://www.toptal.com/developers/gitignore/api/vim,sbt,node,ruby,java,scala,linux,maven,gradle,angular,libreoffice,intellij+all,intellij+iml,visualstudiocode' > .gitignore_global
cat "$SCRIPT_DIR/gitignore_custom" >> .gitignore_global

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
amend_path "$HOME/opt"

# register local git extensions
for ext in ~/src/git-extensions/*
do
    amend_path "$ext"
done

echo "export PATH=${amend_path_content/:}:node_modules/.bin" > ~/.zsh_path
echo "export CHROME_BIN=$(which chromium)" >> .zsh_path

echo 'Done.'
