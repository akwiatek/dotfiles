#!/bin/sh

set -e

git_pull_each() {
    for d in *; do
        echo "$d"
        cd "$d"
        git pull
        cd -
    done
}

safe_cd() {
    [ -d "$1" ] || mkdir --parents "$1"
    cd "$1"
}

try_git_clone() {
    [ -d "$(basename "${1%.git}")" ] || git clone "$1"
}

safe_cd ~/src/git-extensions/
try_git_clone https://github.com/mhagger/git-imerge
try_git_clone https://github.com/tkrajina/git-plus
try_git_clone https://github.com/unixorn/git-extra-commands

git_pull_each

cd ~
[ -d .oh-my-zsh ] || sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

safe_cd ~/.oh-my-zsh/custom/plugins/
[ -L git-extra-commands ] || ln --symbolic ~/src/git-extensions/git-extra-commands git-extra-commands
try_git_clone https://github.com/zsh-users/zsh-completions

git_pull_each

rm --force ~/.zcompdump*

[ -d ~/.fzf ] || git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

git_pull_each

~/.fzf/install --completion --key-bindings --no-update-rc

safe_cd ~/.vim/undo/
safe_cd ~/.vim/swaps/

safe_cd ~/.vim/opt/
try_git_clone https://github.com/tpope/vim-pathogen.git

git_pull_each

safe_cd ~/.vim/autoload/
[ -L pathogen.vim ] || ln --symbolic ../opt/vim-pathogen/autoload/pathogen.vim pathogen.vim

safe_cd ~/.vim/bundle/
try_git_clone https://github.com/airblade/vim-gitgutter
try_git_clone https://github.com/alvan/vim-closetag
try_git_clone https://github.com/bronson/vim-trailing-whitespace
try_git_clone https://github.com/ctrlpvim/ctrlp.vim
try_git_clone https://github.com/easymotion/vim-easymotion
try_git_clone https://github.com/flazz/vim-colorschemes
try_git_clone https://github.com/godlygeek/csapprox
try_git_clone https://github.com/gregsexton/gitv
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
try_git_clone https://github.com/tpope/vim-fugitive.git
try_git_clone https://github.com/tpope/vim-git
try_git_clone https://github.com/vim-scripts/argwrap.vim
try_git_clone https://github.com/vim-scripts/camelcasemotion
try_git_clone https://github.com/vim-scripts/JavaDecompiler.vim.git
try_git_clone https://github.com/vim-scripts/Merginal
try_git_clone https://github.com/Xuyuanp/nerdtree-git-plugin

git_pull_each

safe_cd ~/.vim/syntax/
curl --silent --show-error http://www.haproxy.org/download/contrib/haproxy.vim > haproxy.vim

unset -f git_pull_each
unset -f safe_cd
unset -f try_git_clone
