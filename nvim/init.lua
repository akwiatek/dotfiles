-- disable VI mode
vim.opt.compatible = false

vim.opt.autochdir = false
vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.autowrite = true
vim.opt.backspace = {
    'indent',
    'eol',
    'start'
}
vim.opt.backup = false
vim.opt.breakindent = true
-- use dictionary files in autocompletion
vim.opt.complete = {
    '.',
    'w',
    'b',
    'u',
    't',
    'k'
}
vim.opt.completeopt= {
    'longest',
    'menuone',
    'preview',
    'noinsert',
    'noselect'
}
vim.opt.confirm = true
vim.opt.copyindent = true
vim.opt.cursorline = false
vim.opt.diffopt = {
    'filler',
    'iwhite',
    'vertical'
}
vim.opt.directory = '~/.vim/swaps//'
vim.opt.display = {
    'lastline',
    'uhex'
}
vim.opt.encoding = 'utf-8'
vim.opt.equalalways = false
vim.opt.expandtab = true
vim.opt.fixendofline = true
vim.opt.foldenable = true
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = 'indent'
vim.opt.guifont = 'Fira Code:h9'
-- same as g:ackprg
vim.opt.grepprg = 'rg --vimgrep'
vim.opt.hidden = true
vim.opt.history = 500
vim.opt.hlsearch = true
vim.opt.ignorecase = false
vim.opt.incsearch = true
vim.opt.infercase = true
vim.opt.laststatus = 2
vim.opt.linebreak = true
vim.opt.matchtime = 2
-- Never handle mouse selection in the editor
vim.opt.mouse = ''
vim.opt.number = true
-- Search for files recursively in the current folder
vim.opt.path:append('**')
vim.opt.relativenumber = true
vim.opt.ruler = true
-- padding around current line
vim.opt.scrolloff = 2
vim.opt.shiftround = true
-- same as tabstop
vim.opt.shiftwidth = 0
--[[
           l     use "999L, 888B" instead of "999 lines, 888 bytes"      *shm-l*

            o     overwrite message for writing a file with subsequent    *shm-o*
                  message for reading a file (useful for ":wn" or when
                  'autowrite' on)
            O     message for reading a file overwrites any previous      *shm-O*
                  message;  also for quickfix message (e.g., ":cn")
            s     don't give "search hit BOTTOM, continuing at TOP" or    *shm-s*
                  "search hit TOP, continuing at BOTTOM" messages; when using
                  the search count do not show "W" after the count message (see
                  S below)
            t     truncate file message at the start if it is too long    *shm-t*
                  to fit on the command-line, "<" will appear in the left most
                  column; ignored in Ex mode
            T     truncate other messages in the middle if they are too   *shm-T*
                  long to fit on the command line; "..." will appear in the
                  middle; ignored in Ex mode
            A     don't give the "ATTENTION" message when an existing     *shm-A*
                  swap file is found
            I     don't give the intro message when starting Vim,         *shm-I*
                  see |:intro|
            C     don't give messages while scanning for ins-completion   *shm-C*
                  items, for instance "scanning tags"
--]]
vim.opt.shortmess = 'ltToOCIAs'
vim.opt.showbreak = '↪ '
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.showtabline = 2
vim.opt.signcolumn = 'yes'
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.smarttab = true
-- same as shiftwidth
vim.opt.softtabstop = -1
vim.opt.spelllang = {
    'en',
    'pl'
}
vim.opt.spell = false
-- used mostly to position the preview window coming from completeopt
vim.opt.splitbelow = true
vim.opt.startofline = false
vim.opt.swapfile = false
vim.opt.synmaxcol = 500
vim.opt.tabstop = 4
vim.opt.undodir = '.vim/undo//'
vim.opt.undofile = false
vim.opt.undolevels = 10000
-- delay to save a swap file.
-- delay before Tagbar gets updated.
vim.opt.updatetime = 400
vim.opt.wildmenu = true
vim.opt.wildmode = 'full'
vim.opt.winheight = 4
vim.opt.wrap = true
--[[
          Make a backup before overwriting a file.  The backup is removed after
          the file was successfully written, unless the 'backup' option is
          also on.
          WARNING: Switching this option off means that when Vim fails to write
          your buffer correctly and then, for whatever reason, Vim exits, you
          lose both the original file and what you were writing.
--]]
vim.opt.writebackup = false
-- don't show files in these folders in Ctrl-P
vim.opt.wildignore = {
    '*/compiledts/*',
    '*/dist/*',
    '*/release/*',
    '*/node_modules/*',
    '*/reports/*',
    '*/bin/*',
    '*/build/*',
    '*/target/*',
    '*/.idea/*',
    '*/.idea_modules/*',
    '*/fonts/*',
    '*/images/*',
    '*/libs/*'
}

vim.g.do_syntax_sel_menu = 1

-- Disable syntax files in Polyglot which are handled by separate plugins
vim.g.polyglot_disabled = {
    'java',
    'tmux'
}

vim.cmd.syntax('on')
vim.cmd.filetype('plugin indent on')

--[[
For a list of all available named colors see ':runtime syntax/colortest.vim'
Some colors have to changed later, after CSApprox is loaded. See 'CSApprox_hook_post'
For a list of all available highlight colors see ':help highlight-groups'
--]]

if vim.env.COLOR_THEME == 'light' then
    vim.opt.background = 'light'

    vim.cmd.colorscheme("donbass")
    vim.cmd([[
        " pop up menu
        " highlight Pmenu    ctermfg=white ctermbg=darkgray  guifg=white guibg=darkgray
        highlight Pmenu    ctermfg=250 ctermbg=239 guifg=Black guibg=Grey65
        highlight PmenuSel ctermfg=16 ctermbg=214 guifg=Black guibg=Yellow
    ]])
else
    vim.opt.background = 'dark'

    vim.cmd.colorscheme("af")
    vim.cmd([[
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
    ]])
end

vim.cmd.cnoreabbrev("dt diffthis")

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = { "*.dump" }, command = "set filetype=sql" })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = { "*.g" }, command = "set filetype=antlr3" })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = { "*.g4" }, command = "set filetype=antlr4" })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = { ".eslintrc" }, command = "set filetype=yaml" })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = { "messages" }, command = "set filetype=jproperties" })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = { ".gitconfig.private" }, command = "set filetype=gitconfig" })

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = { "*.json" }, command = "set tabstop=2" })

-- TODO mappings
vim.cmd([[
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
    " s - ALE find references in other files
    map <Leader>s :ALEFindReferences<CR>
    " S - ALE repeat last find references
    map <Leader>S :ALERepeatSelection<CR>
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

]])

-- Allow to close tags in the following XML-like files
vim.g.closetag_filenames = '*.html,*.xhtml,*.phtml,*.xml'

vim.g.syntastic_always_populate_loc_list = 1
vim.g.syntastic_check_on_open = 1
vim.g.syntastic_check_on_wq = 0
vim.g.syntastic_java_checkers = {}
vim.g.syntastic_javascript_checkers = {}
vim.g.syntastic_typescript_checkers = {}
vim.g.syntastic_javascript_eslint_args = '--cache --cache-location node_modules/.eslint/'
vim.g.syntastic_typescript_eslint_args = '--cache --cache-location node_modules/.eslint/'
vim.g.syntastic_error_symbol = '❌'
vim.g.syntastic_warning_symbol = '🍀'
vim.g.syntastic_html_tidy_blocklevel_tags = {}
vim.g.syntastic_html_tidy_inline_tags = {}
vim.g.syntastic_html_tidy_empty_tags = {}
vim.g.syntastic_html_tidy_ignore_errors = {}

-- Do not change filetype of .js files to javascript.jsx (React)
-- javascript.jsx filetype is not supported by taglist.vim plugin
vim.g.jsx_pragma_required = 1

vim.g.ctrlp_cmd = 'CtrlPLastMode'
-- Set delay to prevent extra search
vim.g.ctrlp_lazy_update = 350
-- Look up by both directory and file names
vim.g.ctrlp_by_filename = 0
-- Persisent cache
vim.g.ctrlp_use_caching = 1
vim.g.ctrlp_clear_cache_on_exit = 0
-- Unlimited number of files
vim.g.ctrlp_max_files = 0
-- Faster caching in git repositories
vim.g.ctrlp_user_command = {
    '.git',
    'cd %s && git ls-files | grep --invert-match /libs/'
}
vim.g.ctrlp_line_prefix = '-> '
--vim.g.ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
--vim.g.ctrlp_match_func = {'match' : 'matcher#cmatch' }
vim.g.ctrlp_extensions = {
    'smarttabs',
    'history/cmd',
    'history/search',
    'yankring',
    'tag',
    'tjump'
}

vim.g.ack_use_cword_for_empty_search = 1
vim.g.ackhighlight = 1
-- same as grepprg
vim.g.ackprg = 'rg --vimgrep'

if vim.env.COLOR_THEME == 'light' then
    --" marks
    vim.g.CSApprox_hook_post = {
        'highlight clear MarkologyHLo',
        'highlight link MarkologyHLo LineNr'
    }
else
    --" transparent background
    vim.g.CSApprox_hook_post = {
        'highlight Comment          ctermfg=lightGrey ctermbg=darkGrey',
        'highlight CocErrorFloat    ctermfg=209',
        'highlight CocInfoFloat     ctermfg=190',
        'highlight CocWarningFloat  ctermfg=214',
        'highlight CursorLine       ctermbg=58',
        'highlight PreProc          ctermfg=11',
        'highlight Pmenu            ctermbg=239',
        'highlight Normal           ctermbg=none',
        'highlight NonText          ctermbg=none',
        'highlight SignColumn       ctermbg=none',
        'highlight SpellBad         ctermfg=1',
        'highlight SpellCap         ctermfg=yellow'
    }
end

vim.g.used_javascript_libs = 'jquery,underscore,angularjs,angularui,angularuirouter,jasmine'

-- Sort entries by name rather than by chronological order
vim.g.Tlist_Sort_Type = 'name'
vim.g.Tlist_WinWidth = 45
vim.g.Tlist_Close_On_Select = 1

vim.g.ycm_autoclose_preview_window_after_completion = 1
vim.g.ycm_key_detailed_diagnostics = ''
vim.g.ycm_filetype_whitelist = { go = 1 }

vim.g['vim_current_word#highlight_current_word'] = 0

vim.g['prettier#exec_cmd_async'] = 1
vim.g['prettier#quickfix_enabled'] = 0
vim.g['prettier#autoformat'] = 0
-- Prettier 2.x support
vim.g['prettier#config#arrow_parens'] = 'always'
vim.g['prettier#config#trailing_comma'] = 'all'
vim.g['prettier#exec_cmd_path'] = 'corepack yarn prettier'

vim.api.nvim_create_autocmd({ "BufWritePre" }, { pattern = { '*.html,*.js,*.scss,*.ts' }, command = "Prettier" })
vim.api.nvim_create_autocmd({ "BufWritePre" }, { pattern = { '*.rs' }, command = "RustFmt" })

vim.g.go_auto_type_info = 0
vim.g.go_def_mode='gopls'
vim.g.go_info_mode='gopls'

vim.g.ale_set_highlights = 0
vim.g.ale_virtualtext_cursor = 'disabled'
vim.g.ale_completion_autoimport = 1
vim.g.ale_completion_enabled = 1
vim.g.ale_typescript_eslint_options = ''
vim.g.ale_javascript_eslint_options = ''
--let g:ale_lint_on_text_changed = 'never'
--let g:ale_lint_on_insert_leave = 0
vim.g.ale_lint_on_enter = 0
vim.g.ale_lint_on_save = 0
vim.g.ale_linters = {
    go = {'gopls'},
    javascript = {'tsserver'},
    typescript = {'tsserver'}
}
vim.g.ale_typescript_tsserver_executable = 'tsserver --disableAutomaticTypingAcquisition'

vim.g.highlightedyank_highlight_duration = 400

require'nvim-treesitter.configs'.setup {
               auto_install = true,
               highlight = {
                   enable = true
               }
             }

vim.lsp.config.rust_analyzer = {
  cmd = {"rustup", "run", "stable", "rust-analyzer"},
}

vim.lsp.enable("rust_analyzer")
