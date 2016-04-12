#!/bin/sh

pull_git_repositories() {
    for d in *; do
        echo "$d"
        cd "$d"
        git pull
        cd -
    done
}

[ -d ~/src/git-extensions/ ] || mkdir -p ~/src/git-extensions/
cd ~/src/git-extensions/
[ -d git-imerge ] || git clone https://github.com/mhagger/git-imerge
[ -d git-plus ] || git clone https://github.com/tkrajina/git-plus
[ -d git-extra-commands ] || git clone https://github.com/unixorn/git-extra-commands

pull_git_repositories

cd ~
[ -d .oh-my-zsh ] || sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

[ -d ~/.oh-my-zsh/custom/plugins/ ] || mkdir -p ~/.oh-my-zsh/custom/plugins/
cd ~/.oh-my-zsh/custom/plugins/
[ -L git-extra-commands ] || ln --symbolic ~/src/git-extensions/git-extra-commands git-extra-commands
[ -d zsh-completions ] || git clone https://github.com/zsh-users/zsh-completions

pull_git_repositories

rm --force ~/.zcompdump*

[ -d ~/.fzf ] || git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

pull_git_repositories

~/.fzf/install --completion --key-bindings --no-update-rc

[ -d ~/.vim/undo/ ] || mkdir -p ~/.vim/undo/
[ -d ~/.vim/swaps/ ] || mkdir -p ~/.vim/swaps/

[ -d ~/.vim/opt/ ] || mkdir -p ~/.vim/opt/
cd ~/.vim/opt/
[ -d vim-pathogen ] || git clone https://github.com/tpope/vim-pathogen.git

pull_git_repositories

[ -d ~/.vim/autoload/ ] || mkdir -p ~/.vim/autoload/
cd ~/.vim/autoload/
[ -L pathogen.vim ] || ln --symbolic ../opt/vim-pathogen/autoload/pathogen.vim pathogen.vim

[ -d ~/.vim/bundle/ ] || mkdir -p ~/.vim/bundle/
cd ~/.vim/bundle/
[ -d csapprox ] || git clone https://github.com/godlygeek/csapprox
[ -d ctrlp.vim ] || git clone https://github.com/ctrlpvim/ctrlp.vim
[ -d gitv ] || git clone https://github.com/gregsexton/gitv
[ -d javascript-libraries-syntax.vim ] || git clone https://github.com/othree/javascript-libraries-syntax.vim
[ -d nerdcommenter ] || git clone https://github.com/scrooloose/nerdcommenter
[ -d nerdtree ] || git clone https://github.com/scrooloose/nerdtree
[ -d nerdtree-git-plugin ] || git clone https://github.com/Xuyuanp/nerdtree-git-plugin
[ -d syntastic ] || git clone https://github.com/scrooloose/syntastic
[ -d undotree ] || git clone https://github.com/mbbill/undotree
[ -d vim-closetag ] || git clone https://github.com/alvan/vim-closetag
[ -d vim-colorschemes ] || git clone https://github.com/flazz/vim-colorschemes
[ -d vim-easymotion ] || git clone https://github.com/easymotion/vim-easymotion
[ -d vim-fugitive ] || git clone https://github.com/tpope/vim-fugitive.git
[ -d vim-git ] || git clone https://github.com/tpope/vim-git
[ -d vim-gitgutter ] || git clone https://github.com/airblade/vim-gitgutter
[ -d JavaDecompiler.vim ] || git clone https://github.com/vim-scripts/JavaDecompiler.vim.git
[ -d tmux.vim ] || git clone https://github.com/keith/tmux.vim
[ -d vim-polyglot ] || git clone https://github.com/sheerun/vim-polyglot
[ -d greplace.vim ] || git clone https://github.com/skwp/greplace.vim
[ -d vim-indent-guides ] || git clone https://github.com/nathanaelkane/vim-indent-guides
[ -d camelcasemotion ] || git clone https://github.com/vim-scripts/camelcasemotion
[ -d ack.vim ] || git clone https://github.com/mileszs/ack.vim
[ -d argwrap.vim ] || git clone https://github.com/vim-scripts/argwrap.vim
[ -d Merginal ] || git clone https://github.com/vim-scripts/Merginal
[ -d vim-trailing-whitespace ] || git clone https://github.com/bronson/vim-trailing-whitespace

pull_git_repositories

[ -d ~/.vim/syntax/ ] || mkdir -p ~/.vim/syntax/
curl --silent --show-error http://www.haproxy.org/download/contrib/haproxy.vim > ~/.vim/syntax/haproxy.vim

unset -f pull_git_repositories
