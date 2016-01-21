let os=substitute(system('uname'), '\n', '', '')
let ismac=os == 'Darwin'
let islinux=os == 'Linux'

" disable VI mode
set nocompatible

set noautochdir
set   autoindent
set   autoread
set   autowrite
set   background=dark
set   backspace=indent,eol,start
set nobackup
set   completeopt=menuone,preview
if ismac
    set   completeopt+=noinsert,noselect
endif
set   confirm
set   copyindent
set   diffopt=filler,iwhite,vertical
set   directory=~/.vim/swaps//
set   display+=uhex
set noequalalways
set   expandtab
set   foldenable
set   foldlevelstart=99
set   foldmethod=indent
set   hidden
set   hlsearch
set noignorecase
set   incsearch
set   laststatus=2
set   linebreak
set   matchtime=2
set   number
set   relativenumber
set   ruler
set   shiftround
" same as tabstop
set   shiftwidth=0
set   shortmess+=I
set   showbreak=>>
set   showcmd
set   showmatch
set   showtabline=2
set   smartcase
set   smartindent
set   smarttab
set   softtabstop=4
set   spelllang=en,pl
set nospell
set nostartofline
set   tabstop=4
set   undodir=~/.vim/undo//
set   wildmenu
set   wildmode=full
set   winheight=4
set   wrap

" don't show files in these folders in Ctrl-P
" Node.js
set wildignore+=*/bower_components/*
set wildignore+=*/dist/*
set wildignore+=*/gulp/*
set wildignore+=*/node_modules/*
" Maven
set wildignore+=*/target/*

let do_syntax_sel_menu=1

syntax on
filetype plugin on

execute pathogen#infect()

colorscheme af

highlight Guideline ctermbg=brown
match Guideline /\%>80v.\+/

cnoreabbrev dt diffthis

au BufRead,BufNewFile *.raml set syntax=yaml
au BufRead,BufNewFile *.postman_dump set syntax=yaml
au BufRead,BufNewFile *.ldif.j2 set filetype=ldif
au BufRead,BufNewFile haproxy* set filetype=haproxy
" TODO protractor
au BufRead,BufNewFile *Tests.js set filetype=jasmine.javascript

map <F2>  :set wrap!<CR>:set wrap?<CR>
map <F3>  :set list!<CR>:set list?<CR>
map <F4>  :set paste!<CR>:set paste?<CR>
map <F5>  :edit<CR>
map <F7>  :marks<CR>
map <F8>  :buffers<CR>
map <F10> :quitall<CR>
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
map <Leader>t :tabnew<CR>

" Allow to close tags in the following XML-like files
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.xml"

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Disable syntax files in Polyglot which are handled by separate plugins
let g:polyglot_disabled = ['tmux']
