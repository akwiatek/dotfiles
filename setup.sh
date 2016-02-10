#!/bin/sh

pull_git_repositories() {
    for d in *; do
        echo "$d"
        cd "$d"
        git pull
        cd -
    done
}

cd ~
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

[ -d ~/.oh-my-zsh/custom/plugins/ ] || mkdir -p ~/.oh-my-zsh/custom/plugins/
cd ~/.oh-my-zsh/custom/plugins/
git clone https://github.com/zsh-users/zsh-completions

pull_git_repositories

rm --force ~/.zcompdump*

[ -d ~/src/git-extensions/ ] || mkdir -p ~/src/git-extensions/
cd ~/src/git-extensions/
git clone https://github.com/mhagger/git-imerge
git clone https://github.com/tkrajina/git-plus

pull_git_repositories

[ -d ~/.vim/undo/ ] || mkdir -p ~/.vim/undo/
[ -d ~/.vim/swaps/ ] || mkdir -p ~/.vim/swaps/

[ -d ~/.vim/opt/ ] || mkdir -p ~/.vim/opt/
cd ~/.vim/opt/
git clone https://github.com/tpope/vim-pathogen.git

pull_git_repositories

[ -d ~/.vim/autoload/ ] || mkdir -p ~/.vim/autoload/
cd ~/.vim/autoload/
[ -L ./pathogen.vim ] || ln --symbolic ../opt/vim-pathogen/autoload/pathogen.vim ./pathogen.vim

[ -d ~/.vim/bundle/ ] || mkdir -p ~/.vim/bundle/
cd ~/.vim/bundle/
git clone https://github.com/godlygeek/csapprox
git clone https://github.com/ctrlpvim/ctrlp.vim
git clone https://github.com/gregsexton/gitv
git clone https://github.com/othree/javascript-libraries-syntax.vim
git clone https://github.com/scrooloose/nerdcommenter
git clone https://github.com/scrooloose/nerdtree
git clone https://github.com/Xuyuanp/nerdtree-git-plugin
git clone https://github.com/scrooloose/syntastic
git clone https://github.com/mbbill/undotree
git clone https://github.com/alvan/vim-closetag
git clone https://github.com/flazz/vim-colorschemes
git clone https://github.com/easymotion/vim-easymotion
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/tpope/vim-git
git clone https://github.com/airblade/vim-gitgutter
git clone https://github.com/vim-scripts/JavaDecompiler.vim.git
git clone https://github.com/keith/tmux.vim
git clone https://github.com/sheerun/vim-polyglot
git clone https://github.com/skwp/greplace.vim
git clone https://github.com/nathanaelkane/vim-indent-guides
git clone https://github.com/vim-scripts/camelcasemotion
git clone https://github.com/mileszs/ack.vim
git clone https://github.com/vim-scripts/argwrap.vim
git clone https://github.com/vim-scripts/Merginal

pull_git_repositories

[ -d ~/.vim/syntax/ ] || mkdir -p ~/.vim/syntax/
curl http://www.haproxy.org/download/contrib/haproxy.vim > ~/.vim/syntax/haproxy.vim

unset -f pull_git_repositories
