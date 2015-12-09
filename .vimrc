set noautochdir
set autoindent
set background=dark
set backspace=indent,eol,start
set nocompatible
set completeopt=menuone,preview,noinsert,noselect
set confirm
set copyindent
set directory=/Users/adamkw/.vim/swaps//
set noequalalways
set expandtab
set hidden
set hlsearch
set noignorecase
set incsearch
set number
set relativenumber
set ruler
set shiftwidth=4
set shortmess+=I
set showbreak=>>
set showcmd
set showmatch
set showtabline=2
set smartindent
set softtabstop=4
set nostartofline
set tabstop=4
set wildmenu
set wildmode=full

syntax on
filetype plugin on

execute pathogen#infect()

colorscheme af

au BufRead,BufNewFile *.raml set syntax=yaml
au BufRead,BufNewFile *.postman_dump set syntax=yaml
au BufRead,BufNewFile *.ldif.j2 set filetype=ldif
" http://www.haproxy.org/download/contrib/haproxy.vim
au BufRead,BufNewFile haproxy* set filetype=haproxy
" TODO protractor
au BufRead,BufNewFile *Tests.js set filetype=jasmine.javascript

map <F2> :set wrap!<CR>:set wrap?<CR>
map <F3> :set list!<CR>:set list?<CR>
map <F4> :set paste!<CR>:set paste?<CR>
map <F5> :edit<CR>
map <F7> :marks<CR>
map <F8> :buffers<CR>
map <Esc><Esc> :nohlsearch<CR>
map [l :lprevious<CR>
map ]l :lnext<CR>
map [t :tabprevious<CR>
map ]t :tabnext<CR>
map <Leader>b :Gblame<CR>
map <Leader>f :NERDTreeFind<CR>
map <Leader>h :UndotreeShow<CR>:UndotreeFocus<CR>
" rename current word
map <Leader>r :%s/\<<C-r><C-w>\>/<C-r><C-w>/g<Left><Left>

" Allow to close tags in the following XML-like files
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.xml"

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
