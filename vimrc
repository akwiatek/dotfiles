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
set   completeopt=menuone
try
    set completeopt+=noinsert,noselect
catch E474
    " do nothing
endtry
set   confirm
set   copyindent
" see 'highlight CursorLine'
set   cursorline
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
" Never handle mouse selection in the editor
set   mouse=
set   number
" Search for files recursively in the current folder
set   path+=**
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
" same as shiftwidth
set   softtabstop=-1
set   spelllang=en,pl
set nospell
set nostartofline
set   tabstop=4
set   undodir=~/.vim/undo//
set   undofile
set   undolevels=10000
" delay to save a swap file.
" delay before Tagbar gets updated.
set   updatetime=500
set   wildmenu
set   wildmode=full
set   winheight=4
set   wrap

" don't show files in these folders in Ctrl-P
" Node.js
set wildignore+=*/dist/*
set wildignore+=*/release/*
set wildignore+=*/node_modules/*
set wildignore+=*/reports/*
" Gradle
set wildignore+=*/bin/*
set wildignore+=*/build/*
" Maven
set wildignore+=*/target/*
" Ansible galaxy
set wildignore+=*/roles/*
" IntelliJ
set wildignore+=*/.idea/*
set wildignore+=*/.idea_modules/*
" 3rd party dependencies
set wildignore+=*/fonts/*
set wildignore+=*/images/*
set wildignore+=*/libs/*

let do_syntax_sel_menu=1

syntax on
filetype plugin on

execute pathogen#infect()

colorscheme af

" For a list of all available named colors see ':runtime syntax/colortest.vim'
" Some colors have to changed later, after CSApprox is loaded. See 'CSApprox_hook_post'
" For a list of all available highlight colors see ':help highlight-groups'

" vimdiff colors
highlight DiffAdd    term=bold cterm=bold ctermfg=green ctermbg=black gui=bold guifg=green  guibg=black
highlight DiffChange term=bold cterm=bold ctermfg=blue  ctermbg=black gui=bold guifg=yellow guibg=black
highlight DiffDelete term=bold cterm=bold ctermfg=red   ctermbg=black gui=bold guifg=red    guibg=black
highlight DiffText   term=bold cterm=bold ctermfg=white ctermbg=red   gui=bold guifg=white  guibg=red

" pop up menu
highlight Pmenu    ctermfg=white ctermbg=brown  guifg=white guibg=brown
highlight PmenuSel ctermfg=black ctermbg=yellow guifg=black guibg=yellow

" other colors
highlight Visual    ctermfg=white ctermbg=blue guifg=white guibg=DodgerBlue4
highlight Guideline               ctermbg=blue             guibg=purple4

" Syntastic colors
highlight link SyntasticErrorSign   SignColumn
highlight link SyntasticWarningSign SignColumn

" filestyle plugin requires this color to be defined
highlight Normal ctermbg=black

match Guideline /\%>125v.\+/

cnoreabbrev dt diffthis

autocmd BufRead,BufNewFile *.dump set filetype=sql
autocmd BufRead,BufNewFile *.g set filetype=antlr3
autocmd BufRead,BufNewFile *.g4 set filetype=antlr4
autocmd BufRead,BufNewFile .eslintrc set filetype=yaml
autocmd BufRead,BufNewFile messages set filetype=jproperties
autocmd BufRead,BufNewFile .gitconfig.private set filetype=gitconfig

autocmd BufRead,BufNewFile *.json set tabstop=2
autocmd BufRead,BufNewFile *.js set tabstop=4

autocmd filetype crontab setlocal nobackup nowritebackup

" swap ctrl-] with g ctrl-] (use :tjump instead of :tag)
nnoremap <c-]> g<c-]>
vnoremap <c-]> g<c-]>
nnoremap g<c-]> <c-]>
vnoremap g<c-]> <c-]>

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
map [e :cprevious<CR>
map ]e :cnext<CR>
" a - argument wrap
map <Leader>a :ArgWrap<CR>
" b - blame
map <Leader>b :Gblame<CR>
" c - checkout a branch
map <Leader>c :Twiggy<CR>
" d - declared methods / values
map <Leader>d :TlistOpen<CR>
" e - errors shown in the quickfix window
map <Leader>e :copen<CR>
" f - file manager
map <Leader>f :NERDTreeFind<CR>
" g - git index manager
map <Leader>g :Magit<CR>
" h - history of changes
map <Leader>h :UndotreeShow<CR>:UndotreeFocus<CR>
" m - file members
map <Leader>m :TagbarOpen fj<CR>
" r - rename current word
map <Leader>r :%s/\<<C-r><C-w>\>/<C-r><C-w>/g<Left><Left>
" t - tab creation
map <Leader>t :tabnew<CR>
" u - UUID generator
map <Leader>u di""=systemlist('uuidgen')[0]<CR>P
" w - window interactive mode
map <leader>w :InteractiveWindow<CR>
" x - fiX whitespaces
map <Leader>x :FileStyleFix<CR>
" / - search in files
map <Leader>/ :Ack<Space>

map <Leader><C-^> :TsuquyomiReferences<CR>
map <Leader><C-]> :TsuquyomiDefinition<CR>

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
    \ ]
let g:syntastic_html_tidy_inline_tags = []
let g:syntastic_html_tidy_empty_tags = []
let g:syntastic_html_tidy_ignore_errors = [
    \ ]

" Disable syntax files in Polyglot which are handled by separate plugins
let g:polyglot_disabled = ['tmux']
" Do not change filetype of .js files to javascript.jsx (React)
" javascript.jsx filetype is not supported by taglist.vim plugin
let g:jsx_pragma_required = 1

let g:ctrlp_cmd = 'CtrlPLastMode'
" Look up by both directory and file names
let g:ctrlp_by_filename = 0
" Persisent cache
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
" Unlimited number of files
let g:ctrlp_max_files = 0
" Faster caching in git repositories
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files | grep --invert-match /libs/']
let g:ctrlp_line_prefix = ' »--► '

let g:ack_use_cword_for_empty_search = 1
let g:ackhighlight = 1
let g:ackprg = 'rg --vimgrep'

" transparent background
let g:CSApprox_hook_post = [
    \ 'highlight CursorLine ctermbg=17   cterm=bold',
    \ 'highlight Pmenu      ctermbg=brown',
    \ 'highlight Normal     ctermbg=none',
    \ 'highlight NonText    ctermbg=none'
    \ ]

let g:tagbar_width = 50
" 0: Use the width of the longest currently visible tag.
let g:tagbar_zoomwidth = 0
" 1: Show absolute line numbers.
let g:tagbar_show_linenumbers = 1
let g:tagbar_autopreview = 1
let g:tagbar_previewwin_pos = "rightbelow"

let g:used_javascript_libs = 'jquery,underscore,angularjs,angularui,angularuirouter,jasmine'

let g:tsuquyomi_disable_default_mappings = 1

" Sort entries by name rather than by chronological order
let Tlist_Sort_Type = 'name'
let Tlist_WinWidth = 45
let Tlist_Close_On_Select = 1

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_detailed_diagnostics = ''

let g:vim_current_word#highlight_current_word = 0

let g:prettier#exec_cmd_async = 1
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat = 0
autocmd BufWritePre *.html,*.js,*.scss,*.ts Prettier
