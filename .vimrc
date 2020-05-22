" Settings {{{

" UTF encoding
set encoding=utf-8
scriptencoding utf-8

" Switch syntax highlighting on, when the terminal has colors
syntax on

" No backup files
set nobackup

" No write backup
set nowritebackup

" No swap file
set noswapfile

" Command history
set history=100

" Always show cursor
set ruler

" Show incomplete commands
set showcmd

" Incremental searching (search as you type)
set incsearch

" Highlight search matches
set hlsearch

" Ignore case in search
set smartcase

" Make sure any searches /searchPhrase doesn't need the \c escape character
set ignorecase

" A buffer is marked as ‚Äòhidden‚Äô if it has unsaved changes, and it is not currently loaded in a window
" if you try and quit Vim while there are hidden buffers, you will raise an error:
" E162: No write since last change for buffer ‚Äúa.txt‚Äù
set hidden

" Turn word wrap off
set nowrap

" Allow backspace to delete end of line, indent and start of line characters
set backspace=indent,eol,start

" Convert tabs to spaces
set expandtab

" Turn on line numbers
set number

" Highlight tailing whitespace
" See issue: https://github.com/Integralist/ProVim/issues/4
set list listchars=tab:\ \ ,trail:·

" Get rid of the delay when pressing O (for example)
" http://stackoverflow.com/questions/2158516/vim-delay-before-o-opens-a-new-line
set timeout timeoutlen=1000 ttimeoutlen=100

" Always show status bar
set laststatus=2

" Set the status line to something useful
set statusline=%f\ %=L:%l/%L\ %c\ (%p%%)

" Hide the toolbar
set guioptions-=T

" Autoload files that have changed outside of vim
set autoread

" Use system clipboard
" http://stackoverflow.com/questions/8134647/copy-and-paste-in-vim-via-keyboard-between-different-mac-terminals
set clipboard+=unnamed

" Don't show intro
set shortmess+=I

" Better splits (new windows appear below and to the right)
set splitbelow
set splitright

" Highlight the current line
set cursorline

" Ensure Vim doesn't beep at you every time you make a mistype
set novisualbell

" Visual autocomplete for command menu (e.g. :e ~/path/to/file)
set wildmenu

" redraw only when we need to (i.e. don't redraw when executing a macro)
set lazyredraw

" highlight a matching [{()}] when cursor is placed on start/end character
set showmatch

" Set built-in file system explorer to use layout similar to the NERDTree plugin
let g:netrw_liststyle=3

" Disable cursor shape by default
set guicursor=

" Always highlight column 80 so it's easier to see where
" cutoff appears on longer screens
" autocmd BufWinEnter * highlight ColorColumn ctermbg=darkred
" set colorcolumn=80
" }}}

" Plugins {{{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')
Plug 'janko-m/vim-test'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-rhubarb'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neomake/neomake'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jmcantrell/vim-virtualenv'
Plug 'leafgarland/typescript-vim'
Plug 'benjie/neomake-local-eslint.vim'
Plug 'sbdchd/neoformat'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
" Plug 'mxw/vim-jsx'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'
Plug 'raimondi/delimitmate'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'epilande/vim-react-snippets'
Plug 'epilande/vim-es2015-snippets'
Plug 'lervag/vimtex'
Plug 'glench/vim-jinja2-syntax'
Plug 'morhetz/gruvbox'
Plug 'rykka/riv.vim'
Plug 'rykka/instantrst'
Plug 'fisadev/vim-isort'
Plug 'wakatime/vim-wakatime'
Plug 'jremmen/vim-ripgrep'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'terryma/vim-multiple-cursors'
Plug 'mattn/emmet-vim'
Plug 'AndrewRadev/splitjoin'
call plug#end()

let g:instant_rst_localhost_only = 1

" let g:python_host_prog = expand('~/.virtualenvs/nvim2/bin/python')
" let g:python3_host_prog = expand('~/.virtualenvs/nvim3/bin/python')

let g:ycm_python_binary_path = 'python'


let g:neomake_python_flake8_maker = {
    \ 'exe': 'flake8',
    \ 'args': ['--max-line-length=120'],
    \ 'errorformat':
        \ '%E%f:%l: could not compile,%-Z%p^,' .
        \ '%A%f:%l:%c: %t%n %m,' .
        \ '%A%f:%l: %t%n %m,' .
        \ '%-G%.%#',
    \ }

let g:vimtex_indent_enabled = 1

" Vim test
let g:test#strategy = 'neovim'

" Neomake
call neomake#configure#automake('rw')

let g:neomake_open_list = 2
let g:neomake_verbose = 0

let g:neomake_place_signs = 1
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_tex_enabled_makers = ['lacheck']
let g:neomake_typescript_tslint_args = []
let g:neomake_css_enabled_makers = ['csslint']
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_json_enabled_makers = ['jsonlint']
let g:neomake_sh_enabled_makers = ['shellcheck']

let g:test#python#djangotest#file_pattern = '\.py'

" function! neomake#makers#ft#scss#EnabledMakers() abort
"     return ['scsslint']
" endfunction

" function! neomake#makers#ft#scss#scsslint() abort
"     return {
"         \ 'exe': 'scss-lint',
"         \ 'errorformat': '%A%f:%l:%v [%t] %m'
"         \ }
" endfunction

let g:virtualenv_auto_activate = 1
" NeoFormat
" augroup fmt
"   autocmd!
"   autocmd BufWritePre * undojoin | Neoformat
" augroup END
" let g:neoformat_typescript_prettier = {
"     \ 'exe': 'prettier',
"     \ 'args': ['--single-quote']
"     \ }
" let g:neoformat_javascript_prettier = {
"     \ 'exe': 'prettier',
"     \ 'args': ['--single-quote']
"     \ }

" let g:neoformat_enabled_typescript = ['prettier']
" let g:neoformat_enabled_javascript = ['prettier']

" Theme
set background=dark
colorscheme gruvbox

" YouCompleteMe
" let g:ycm_python_binary_path = 'python'
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_autoclose_preview_window_after_completion=1
map <C-g> :YcmCompleter GoToDefinitionElseDeclaration<CR>

let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,python3,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }

" Ack (uses Ag behind the scenes)
let g:ackprg = 'ag --nogroup --nocolor --column'

" Airline (status line)
let g:airline_powerline_fonts = 1

" Gist authorisation settings
let g:github_user = $GITHUB_USER
let g:github_token = $GITHUB_TOKEN
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
" Related plugins:
" https://github.com/mattn/webapi-vim
" https://github.com/vim-scripts/Gist.vim
" https://github.com/tpope/vim-fugitive

" HTML generation using 'emmet-vim'
" NORMAL mode Ctrl+y then , <C-y,>

" Git gutter
let g:gitgutter_enabled = 1
let g:gitgutter_eager = 0
set signcolumn=yes
highlight clear SignColumn
highlight GitGutterAdd guibg=NONE ctermbg=NONE guifg=green ctermfg=green
highlight GitGutterChange guibg=NONE ctermbg=NONE guifg=yellow ctermfg=yellow
highlight GitGutterDelete guibg=NONE ctermbg=NONE guifg=red ctermfg=red
highlight GitGutterChangeDelete guibg=NONE ctermbg=NONE guifg=yellow ctermfg=yellow

" NerdTree
let NERDTreeShowHidden = 1
map <C-n> :NERDTreeToggle<cr>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" NERDTress File highlighting
fun! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfun

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" }}}

" Mappings {{{
" Notes...
"
" :map     j gg (j will be mapped to gg)
" :map     Q j  (Q will also be mapped to gg, because j will be expanded -> recursive mapping)
" :noremap W j  (W will be mapped to j not to gg, because j will not be expanded -> non recursive)
"
" These mappings work in all modes. To have mappings work in only specific
" modes then denote the mapping with the mode character.
"
" e.g.
" to map something in just NORMAL mode use :nmap or :nnoremap
" to map something in just VISUAL mode use :vmap or :vnoremap

" Exit terminal insert mode pressing <C-o>
if has('nvim')
  tmap <C-o> <C-\><C-n>
end

nnoremap <leader>ev :vsplit ~/.vimrc<CR>
nnoremap <leader>ez :vsplit ~/.zshrc<CR>

" Spellcheck
nnoremap <leader>sc :call SpellCheck()<CR>

let s:spellActive = 0
fun! SpellCheck()
  augroup HighlightSpellBad
    autocmd!
  augroup END
  if ! s:spellActive
    " Clear spell bad highlight
    let s:spellActive = 1
    highlight clear SpellBad
    highlight SpellBad cterm=underline,bold ctermfg=yellow
    setlocal spell spelllang=en_us
    autocmd HighlightSpellBad BufWinEnter,BufWinLeave,InsertEnter,InsertLeave * highlight clear SpellBad
    autocmd HighlightSpellBad BufWinEnter,BufWinLeave,InsertEnter,InsertLeave * highlight SpellBad cterm=underline,bold ctermfg=yellow
    autocmd HighlightSpellBad BufWinEnter,BufWinLeave,InsertEnter,InsertLeave * setlocal spell spelllang=en_us
  else
    let s:spellActive = 0
    setlocal nospell
  endif
endfun

" Vimtest
nnoremap <silent> <leader>t :TestNearest<CR>
nnoremap <silent> <leader>T :TestFile<CR>
nnoremap <silent> <leader>a :TestSuite<CR>
nnoremap <silent> <leader>l :TestLast<CR>
nnoremap <silent> <leader>G :TestVisit<CR>

" Clear search buffer
:nnoremap ¬ß :nohlsearch<cr>

" Command to use sudo when needed
cnoremap w!! %!sudo tee > /dev/null %

" Fugitive Git
noremap <leader>gd :Gvdiff<CR>
noremap <leader>gst :Gstatus<CR>
noremap <leader>gco :Git checkout

" FZF Mappings
noremap <C-p> :Files<CR>
noremap <leader>glo :Commits<CR>
noremap <C-s> :GFiles?<CR>
noremap <C-f> :Find<CR>

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" \ -g "*.{js,json,php,md,styl,jade,html,config,groovy,py,cpp,c,go,hs,rb,conf,rss,xml,yml,yaml}"
let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --hidden --follow --color "never"
  \ -g "*.{js,json,php,md,styl,jade,html,config,groovy,py,cpp,c,go,hs,rb,conf,rss,xml,yml,yaml}"
  \ -g "Dockerfile*"
  \ -g "!{.git,node_modules,vendor}/*"
  \ -g "!*{.pyc,.html,.js,.xml,.png,.jpg}" '

command! -bang -nargs=* Find
  \ call fzf#vim#grep(g:rg_command .shellescape(<q-args>).'| tr -d "\017"', 1,
  \ <bang>0 ? fzf#vim#with_preview('up:60%')
  \         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \ <bang>0)

" Buffers
noremap <leader>yb :Buffers<cr>
noremap <leader>ym :Maps<cr>

" Buffers (runs the delete buffer command on all open buffers)
noremap <leader>yd :bufdo bd<cr>

" Make handling vertical/linear Vim windows easier
noremap <leader>w- <C-W>- " decrement height
noremap <leader>w+ <C-W>+ " increment height
noremap <leader>w] <C-W>_ " maximize height
noremap <leader>w[ <C-W>= " equalize all windows

" Handling horizontal Vim windows doesn't appear to be possible.
" Attempting to map <C-W> < and > didn't work
" Same with mapping <C-W>|

" Make splitting Vim windows easier
noremap <leader>; <C-W>s
noremap <leader>` <C-W>v

" Tmux style window selection
noremap <Leader>ws :ChooseWin<cr>
" }}}

" Commands {{{

" Activate VirtualEnv
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" jump to last cursor
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

fun! StripTrailingWhitespace()
  " don't strip on these filetypes
  if &filetype =~# 'markdown'
    return
  endif
  %s/\s\+$//e
endfun

autocmd BufWritePre * call StripTrailingWhitespace()

" Close all folds when opening a new buffer
autocmd BufRead * setlocal foldmethod=marker
autocmd BufRead * normal zM

" file formats
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd Filetype markdown setlocal wrap linebreak nolist textwidth=0 wrapmargin=0 " http://vim.wikia.com/wiki/Word_wrap_without_line_breaks
autocmd FileType sh,cucumber,ruby,yaml,zsh,vim setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=120 autoindent
autocmd FileType jinja,xml setlocal tabstop=4 softtabstop=4 shiftwidth=4 autoindent
autocmd FileType json setlocal tabstop=2 softtabstop=2 shiftwidth=2 autoindent foldmethod=syntax
autocmd FileType typescript,javascript,html,css,scss,tex setlocal tabstop=4 softtabstop=4 shiftwidth=4 autoindent

" WA highlight python `self` word
highlight pythonSelf guifg=blue ctermfg=blue
autocmd FileType python syn match pythonSelf "\(\W\|^\)\@<=self\([\.,)]\)\@="

" specify syntax highlighting for specific files
autocmd Bufread,BufNewFile *.spv set filetype=php
autocmd Bufread,BufNewFile *.md set filetype=markdown " Vim interprets .md as 'modula2' otherwise, see :set filetype?
autocmd Bufread,BufNewFile *.py,*.wsgi set filetype=python fileformat=unix
autocmd Bufread,BufNewFile *.html,*.xml,*.rss,*.jinja set filetype=jinja
autocmd Bufread,BufNewFile *.json set filetype=json
autocmd Bufread,BufNewFile, *.ts,*.tsx set filetype=typescript

" Highlight words to avoid in tech writing
" http://css-tricks.com/words-avoid-educational-writing/
highlight TechWordsToAvoid ctermbg=red ctermfg=white
match TechWordsToAvoid /\cobviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however\|so,\|easy/
autocmd BufWinEnter * match TechWordsToAvoid /\cobviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however,\|so,\|easy/
autocmd InsertEnter * match TechWordsToAvoid /\cobviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however,\|so,\|easy/
autocmd InsertLeave * match TechWordsToAvoid /\cobviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however,\|so,\|easy/
autocmd BufWinLeave * call clearmatches()

" Create a 'scratch buffer' which is a temporary buffer Vim wont ask to save
" http://vim.wikia.com/wiki/Display_output_of_shell_commands_in_new_window
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
    if part[0] =~? '\v[%#<]'
      let expanded_part = fnameescape(expand(part))
      let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
    endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction

" Rainbow parenthesis always on!
if exists(':RainbowParenthesesToggle')
  autocmd VimEnter * RainbowParenthesesToggle
  autocmd Syntax * RainbowParenthesesLoadRound
  autocmd Syntax * RainbowParenthesesLoadSquare
  autocmd Syntax * RainbowParenthesesLoadBraces
endif

" Reset spelling colours when reading a new buffer
" This works around an issue where the colorscheme is changed by .local.vimrc
fun! SetSpellingColors()
  highlight SpellBad cterm=bold ctermfg=white ctermbg=red
  highlight SpellCap cterm=bold ctermfg=red ctermbg=white
endfun
autocmd BufWinEnter * call SetSpellingColors()
autocmd BufNewFile * call SetSpellingColors()
autocmd BufRead * call SetSpellingColors()
autocmd InsertEnter * call SetSpellingColors()
autocmd InsertLeave * call SetSpellingColors()

" Change colourscheme when diffing
fun! SetDiffColors()
  highlight DiffAdd    cterm=bold ctermfg=white ctermbg=DarkGreen
  highlight DiffDelete cterm=bold ctermfg=white ctermbg=DarkGrey
  highlight DiffChange cterm=bold ctermfg=white ctermbg=DarkBlue
  highlight DiffText   cterm=bold ctermfg=white ctermbg=DarkRed
endfun
autocmd FilterWritePre * call SetDiffColors()
" }}}

" Custom {{{

let s:project = split(getcwd(), '/')[-1]

" fun! InitializePythonProject()
"   let virtualenv_name = 'nvim2'
"   for proj in g:py3_projects
"     if proj == s:project
"       let virtualenv_name = 'nvim3'
"       break
"     endif
"   endfor

"   let virtualenv_path = expand('~/.virtualenvs/'.virtualenv_name)
"   let g:neomake_python_flake8_maker = {
"       \ 'exe': expand(virtualenv_path.'/bin/flake8'),
"       \ 'args': ['--max-line-length=120'],
"       \ 'errorformat':
"           \ '%E%f:%l: could not compile,%-Z%p^,' .
"           \ '%A%f:%l:%c: %t%n %m,' .
"           \ '%A%f:%l: %t%n %m,' .
"           \ '%-G%.%#',
"       \ }
"   let gcm_server_python_interpreter = expand(virtualenv_path.'/bin/python')

" endfun

" autocmd FileType python call InitializePythonProject()

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
