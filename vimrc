" disable VI mode
set nocompatible

set noautochdir
set   autoindent
set   autoread
set   autowrite
set   background=dark
set   backspace=indent,eol,start
set nobackup
set   breakindent
" use dictionary files in autocompletion
set   complete+=k
set   completeopt=menuone,preview
try
    set completeopt+=noinsert,noselect
catch E474
    " do nothing
endtry
set   confirm
set   copyindent
set   dictionary=/usr/share/dict/words
set   diffopt=filler,iwhite,vertical
set   directory=~/.vim/swaps//
set   display+=uhex
set noequalalways
set   expandtab
set nofixendofline
set   foldenable
set   foldlevelstart=99
set   foldmethod=indent
set   hidden
set   history=500
set   hlsearch
set noignorecase
set   incsearch
set   infercase
set   laststatus=2
set   linebreak
set   matchtime=2
set   number
" see <F4> mapping
set   pastetoggle=<F4>
set   relativenumber
set   ruler
set   shiftround
" same as tabstop
set   shiftwidth=0
set   shortmess+=I
try
    set   showbreak=↪\  " arrow + space
catch E595
    set   showbreak=`->\  " arrow + space
endtry
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
set   undofile
set   undolevels=10000
set   wildmenu
set   wildmode=full
set   winheight=4
set   wrap

" don't show files in these folders in Ctrl-P
" Node.js
set wildignore+=*/bower_components/*
set wildignore+=*/dist/*
set wildignore+=*/node_modules/*
" Maven
set wildignore+=*/target/*

let do_syntax_sel_menu=1

syntax on
filetype plugin on

execute pathogen#infect()

colorscheme af

" vimdiff colours
highlight DiffAdd    term=bold cterm=bold ctermfg=green ctermbg=black gui=bold guifg=green  guibg=black
highlight DiffChange term=bold cterm=bold ctermfg=blue  ctermbg=black gui=bold guifg=yellow guibg=black
highlight DiffDelete term=bold cterm=bold ctermfg=red   ctermbg=black gui=bold guifg=red    guibg=black
highlight DiffText   term=bold cterm=bold ctermfg=white ctermbg=red   gui=bold guifg=white  guibg=red

" other colours
highlight Visual    ctermfg=white ctermbg=blue guifg=white guibg=DodgerBlue4
highlight Guideline               ctermbg=blue             guibg=purple4

" Syntastic colours
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn

match Guideline /\%>125v.\+/

cnoreabbrev dt diffthis

autocmd BufRead,BufNewFile *.raml set syntax=yaml
autocmd BufRead,BufNewFile *.postman_dump set syntax=yaml
autocmd BufRead,BufNewFile *.ldif.j2 set filetype=ldif
autocmd BufRead,BufNewFile haproxy* set filetype=haproxy
autocmd BufRead,BufNewFile *Tests.js set filetype=jasmine.javascript
autocmd BufRead,BufNewFile .eslintrc set filetype=yaml
autocmd BufRead,BufNewFile .gitconfig.private set filetype=gitconfig

autocmd BufRead,BufNewFile *.ldif.j2 set shiftwidth=2

map <F2>  :set wrap!<CR>:set wrap?<CR>
map <F3>  :set list!<CR>:set list?<CR>
" see pastetoggle
map <F4>  :set paste!<CR>:set paste?<CR>
map <F5>  :edit<CR>
map <F6>  :registers<CR>
map <F7>  :marks<CR>
map <F8>  :buffers<CR>
map <F10> :quitall<CR>
map <Esc><Esc> :nohlsearch<CR>
map [l :lprevious<CR>
map ]l :lnext<CR>
map [t :tabprevious<CR>
map ]t :tabnext<CR>
map <Leader>a :ArgWrap<CR>
map <Leader>b :Gblame<CR>
map <Leader>f :NERDTreeFind<CR>
map <Leader>h :UndotreeShow<CR>:UndotreeFocus<CR>
map <Leader>m :Magit<CR>
" rename current word
map <Leader>r :%s/\<<C-r><C-w>\>/<C-r><C-w>/g<Left><Left>
map <Leader>t :tabnew<CR>
map <Leader>/ :Ack<Space>

" Allow to close tags in the following XML-like files
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.xml'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_java_checkers=[]
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_error_symbol = '❌'
let g:syntastic_warning_symbol = '🍀'
let g:syntastic_html_tidy_blocklevel_tags = [
    \ 'amt-navigation',
    \ 'gov-dataset',
    \ 'gov-digit-box',
    \ 'gov-footer',
    \ 'gov-header',
    \ 'gov-notice',
    \ 'gov-notification',
    \ 'gov-phase-banner',
    \ 'gov-progress-list',
    \ 'gov-search',
    \ 'last-login',
    \ 'next-steps',
    \ 'organisation-summary',
    \ 'server-validation-error',
    \ 'technical-error'
    \ ]
let g:syntastic_html_tidy_inline_tags = []
let g:syntastic_html_tidy_empty_tags = []

" Disable syntax files in Polyglot which are handled by separate plugins
let g:polyglot_disabled = ['tmux']

let g:ctrlp_cmd = 'CtrlPLastMode'

let g:ackprg = 'ag --vimgrep'

" transparent background
let g:CSApprox_hook_post = [
    \ 'highlight Normal  ctermbg=none',
    \ 'highlight NonText ctermbg=none'
    \ ]
