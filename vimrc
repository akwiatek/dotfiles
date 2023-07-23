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
set   completeopt=longest,menuone,preview
try
    set completeopt+=noinsert,noselect
catch /^E474:/
    " do nothing
endtry
set   confirm
set   copyindent
" see 'highlight CursorLine'
set   cursorline
set   diffopt=filler,iwhite,vertical
set   directory=~/.vim/swaps//
set   display+=uhex
set   encoding=utf-8
set noequalalways
set   expandtab
set   fixendofline
set   foldenable
set   foldlevelstart=99
set   foldmethod=indent
" same as g:ackprg
set   grepprg=rg\ --vimgrep
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
" padding around current line
set   scrolloff=2
set   shiftround
" same as tabstop
set   shiftwidth=0
set   shortmess+=I
try
    set   showbreak=↪\  " arrow + space
catch /^E595:/
    set   showbreak=`->\  " arrow + space
endtry
set   showcmd
set   showmatch
set   showtabline=2
set   signcolumn=yes
set   smartcase
set   smartindent
set   smarttab
" same as shiftwidth
set   softtabstop=-1
set   spelllang=en,pl
set nospell
" used mostly to position the preview window coming from completeopt
set   splitbelow
set nostartofline
set noswapfile
" async swapping
if !has('nvim')
    set   swapsync=''
endif
set   synmaxcol=500
set   tabstop=4
set   undodir=~/.vim/undo//
set noundofile
set   undolevels=10000
" delay to save a swap file.
" delay before Tagbar gets updated.
set   updatetime=500
set   wildmenu
set   wildmode=full
set   winheight=4
set   wrap
set nowritebackup

" don't show files in these folders in Ctrl-P
" Node.js
set wildignore+=*/compiledts/*
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

" Disable syntax files in Polyglot which are handled by separate plugins
let g:polyglot_disabled = [
    \ 'java',
    \ 'tmux'
    \ ]

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
highlight Visual    ctermfg=white  ctermbg=blue  guifg=white  guibg=DodgerBlue4
highlight Guideline                ctermbg=blue               guibg=purple4

" Syntastic colors
highlight link SyntasticErrorSign   SignColumn
highlight link SyntasticWarningSign SignColumn

" filestyle plugin requires this color to be defined
highlight Normal ctermbg=black

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
map <c-]> :ALEGoToDefinition<CR>

map <F2>  :set wrap!<CR>:set wrap?<CR>
map <F3>  :set list!<CR>:set list?<CR>
" see pastetoggle
map <F4>  :set paste!<CR>:set paste?<CR>
map <F5>  :edit<CR>
map <F6>  :registers<CR>
map <F7>  :marks<CR>
map <F10> :quitall<CR>
map <Esc><Esc> :nohlsearch<CR>
" args - command line file names
map [a :previous<CR>
map ]a :next<CR>
" buffers
map [b :bprevious<CR>
map ]b :bnext<CR>
" quickfix lists
map [c :colder<CR>
map ]c :cnewer<CR>
" errors from window local list
map [l :lprevious<CR>
map ]l :lnext<CR>
" tabs
map [t :tabprevious<CR>
map ]t :tabnext<CR>
" a - Argument wrap
map <Leader>a :ArgWrap<CR>
" b - Blame
map <Leader>b :Git blame<CR>
" c - Checkout a branch
map <Leader>c :Twiggy<CR>
" d - Declared methods / values
map <Leader>d :TlistOpen<CR>
" e - Errors shown in the quickfix window
map <Leader>e :copen<CR>
" f - File manager
map <Leader>f :NERDTreeFind<CR>
" g - Git index manager
map <Leader>g :Magit<CR>
" h - History of changes
map <Leader>h :UndotreeShow<CR>:UndotreeFocus<CR>
" k - doKumentation for Go
map <Leader>k :GoDoc <C-r><C-w><CR>
" m - file Members
map <Leader>m :TagbarOpen fj<CR>
" r - Rename current word
map <Leader>r :%s/\<<C-r><C-w>\>/<C-r><C-w>/g<Left><Left>
" st - Syntastic Toggle mode
map <Leader>st :SyntasticToggleMode<CR>
" t - Tab creation
map <Leader>t :tabnew<CR>
" u - UUID generator
map <Leader>u di""=systemlist('uuidgen')[0]<CR>P
" w - Window interactive mode
map <leader>w :InteractiveWindow<CR>
" x - fiX whitespaces
map <Leader>x :FileStyleFix<CR>
" / - search in files
map <Leader>/ :Ack!<Space>

map <Leader><C-^> :TsuquyomiReferences<CR>
map <Leader><C-]> :TsuquyomiDefinition<CR>

map <C-K> :GoRun<CR>

" Allow to close tags in the following XML-like files
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.xml'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_java_checkers=[]
let g:syntastic_javascript_checkers = []
let g:syntastic_typescript_checkers = []
let g:syntastic_javascript_eslint_args = '--cache --cache-location node_modules/.eslint/'
let g:syntastic_typescript_eslint_args = '--cache --cache-location node_modules/.eslint/'
let g:syntastic_error_symbol = '❌'
let g:syntastic_warning_symbol = '🍀'
let g:syntastic_html_tidy_blocklevel_tags = [
    \ ]
let g:syntastic_html_tidy_inline_tags = []
let g:syntastic_html_tidy_empty_tags = []
let g:syntastic_html_tidy_ignore_errors = [
    \ ]

" Do not change filetype of .js files to javascript.jsx (React)
" javascript.jsx filetype is not supported by taglist.vim plugin
let g:jsx_pragma_required = 1

let g:ctrlp_cmd = 'CtrlPLastMode'
" Set delay to prevent extra search
let g:ctrlp_lazy_update = 350
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
"let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
"let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
let g:ctrlp_extensions = [
    \ 'smarttabs',
    \ 'history/cmd',
    \ 'history/search',
    \ 'yankring',
    \ 'tag',
    \ 'tjump'
    \ ]

let g:ack_use_cword_for_empty_search = 1
let g:ackhighlight = 1
" same as grepprg
let g:ackprg = 'rg --vimgrep'

" transparent background
let g:CSApprox_hook_post = [
    \ 'highlight Comment          ctermfg=lightGrey ctermbg=darkGrey',
    \ 'highlight CocErrorFloat    ctermfg=209',
    \ 'highlight CocInfoFloat     ctermfg=190',
    \ 'highlight CocWarningFloat  ctermfg=214',
    \ 'highlight CursorLine       ctermbg=58',
    \ 'highlight PreProc          ctermfg=11',
    \ 'highlight Pmenu            ctermbg=239',
    \ 'highlight Normal           ctermbg=none',
    \ 'highlight NonText          ctermbg=none',
    \ 'highlight SignColumn       ctermbg=none',
    \ 'highlight SpellBad         ctermfg=red',
    \ 'highlight SpellCap         ctermfg=yellow'
    \ ]

let g:tagbar_width = 50
" 0: Use the width of the longest currently visible tag.
let g:tagbar_zoomwidth = 0
" 1: Show absolute line numbers.
let g:tagbar_show_linenumbers = 1
let g:tagbar_autopreview = 1
let g:tagbar_previewwin_pos = 'rightbelow'

let g:used_javascript_libs = 'jquery,underscore,angularjs,angularui,angularuirouter,jasmine'

" Sort entries by name rather than by chronological order
let Tlist_Sort_Type = 'name'
let Tlist_WinWidth = 45
let Tlist_Close_On_Select = 1

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_detailed_diagnostics = ''
let g:ycm_filetype_whitelist = {
    \ 'go': 1
    \ }

let g:vim_current_word#highlight_current_word = 0

let g:prettier#exec_cmd_async = 1
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat = 0
" Prettier 2.x support
let g:prettier#config#arrow_parens = 'always'
let g:prettier#config#trailing_comma = 'all'
autocmd BufWritePre *.html,*.js,*.scss,*.ts Prettier

let g:go_auto_type_info = 0
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

let g:ale_completion_autoimport = 1
let g:ale_completion_enabled = 1
let g:ale_typescript_eslint_options = ''
let g:ale_javascript_eslint_options = ''
"let g:ale_lint_on_text_changed = 'never'
"let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 0
let g:ale_linters = {
            \     'go': [
            \         'gopls'
            \     ],
            \     'javascript': [
            \         'tsserver'
            \     ],
            \     'typescript': [
            \         'tsserver'
            \     ]
            \ }

let g:highlightedyank_highlight_duration = 400
