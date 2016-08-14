"-----------------------------------------------------------------------------
" PLUGINS
"-----------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

Plug 'stephpy/vim-yaml' " fix vim bug (yaml syntax lags)

Plug 'Raimondi/delimitMate'

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
imap <silent><expr> <c-n> deoplete#mappings#manual_complete()
let g:deoplete#enable_at_startup = 1
Plug 'zchee/deoplete-jedi'

Plug 'terryma/vim-multiple-cursors'
Plug 'szw/vim-ctrlspace'
let g:ctrlspace_use_tabline = 1

Plug 'rking/ag.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline_theme='tomorrow'
let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n' : 'N',
  \ 'i' : 'I',
  \ 'R' : 'R',
  \ 'c' : 'C',
  \ 'v' : 'V',
  \ 'V' : 'V',
  \ '' : 'V',
  \ 's' : 'S',
  \ 'S' : 'S',
  \ '' : 'S',
  \ }

Plug 'easymotion/vim-easymotion'

Plug 'ctrlpvim/ctrlp.vim'
nmap <m-p> :CtrlPCurFile<cr>

let g:ctrlp_switch_buffer = 0
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*
set wildignore+=*/.git/*

let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|__pycache__)$',
    \ 'file': '\v\.(exe|so|dll|pyc)$',
\ }

Plug 'scrooloose/nerdtree'
map <F8> <esc>:NERDTreeToggle<cr>
map <F18> <esc>:NERDTreeFind<cr>zz
" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=[ '\.pyc$', '\.swp$' ]
let NERDTreeQuitOnOpen=1

Plug 'tpope/vim-commentary'
nmap ,c<space> gcl
vmap ,c<space> gc


Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
" Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


Plug 'majutsushi/tagbar'
map <F2> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0 "tagbar shows tags in order of they created in file
" let g:tagbar_foldlevel = 0 "close tagbar folds by default

Plug 'Align'
Plug 'hynek/vim-python-pep8-indent'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'vcscommand.vim'

Plug 'sjl/gundo.vim'
let g:gundo_prefer_python3 = 1
nmap <F9> :GundoToggle<CR>

Plug 'davidhalter/jedi-vim'
" let g:jedi#completions_enabled = 0
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#show_call_signatures = 0
" dont show preview in copletions
let g:jedi#smart_auto_mappings = 0
" disable autocomplete imports
autocmd FileType python setlocal completeopt-=preview

Plug 'neomake/neomake'
let g:neomake_python_enabled_makers = ['python', 'flake8', 'pylint']
autocmd! BufWritePost,BufEnter *.py Neomake
let g:neomake_yaml_enabled_makers = ['yaml']

let g:neomake_warning_sign = {
  \ 'text': 'W',
  \ 'texthl': 'WarningMsg',
  \ }
let g:neomake_error_sign = {
  \ 'text': 'E',
  \ 'texthl': 'ErrorMsg',
  \ }


call plug#end()

" BASE

scriptencoding utf-8
set encoding=utf-8

" Color scheme
set t_Co=256
color xoria256

set exrc            " enable per-directory .vimrc files
set secure          " disable unsafe commands in local .vimrc files
" be iMproved
set nocompatible
" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source ~/.vimrc

" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","

" Better copy & paste
" Toggle paste mode
nmap <silent> <Leader>p :set invpaste<CR>:set paste?<CR>
set clipboard=unnamed


" Mouse and backspace
set mouse=a  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again

" Turn off that stupid highlight search
" nmap <silent> <Leader>n :set invhls<CR>:set hls?<CR>

" Maps to make handling windows a bit easier
noremap <silent> <Leader>h :wincmd h<CR>
noremap <silent> <Leader>j :wincmd j<CR>
noremap <silent> <Leader>k :wincmd k<CR>
noremap <silent> <Leader>l :wincmd l<CR>

noremap <silent> <Leader>H :wincmd H<CR>
noremap <silent> <Leader>J :wincmd J<CR>
noremap <silent> <Leader>K :wincmd K<CR>
noremap <silent> <Leader>L :wincmd L<CR>


" switch tab by alt + #
map <m-1> <esc>1gt
map <m-2> <esc>2gt
map <m-3> <esc>3gt
map <m-4> <esc>4gt
map <m-5> <esc>5gt
map <m-6> <esc>6gt
map <m-7> <esc>7gt
map <m-8> <esc>8gt
map <m-9> <esc>9gt
map <m-0> <esc>:tablast<CR>

" Buffer commands
" noremap <silent> <Leader>db :bd<CR>
nmap <leader>db :b#<bar>bd#<CR>
" Delete all buffers
nmap <silent> <Leader>da :%bd<cr>:call fugitive#detect(getcwd())<cr>
" предыдущий/следующий буффер
nmap <silent> <M-o> :bp<cr>
nmap <silent> <M-i> :bn<cr>

" начинать редактирование с pwd
" nmap ,e :e <C-R>=expand("%:p:h") . "/" <CR>
nmap <leader>e :e %:h<tab>

" копировать путь к файлу
nmap ,cp :let @*=expand("%")<CR>
nmap ,cl :let @*=expand("%:p")<CR>

" set python breakpoint
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" next and prev errors
nmap [e :lprev<cr>
nmap ]e :lnext<cr>


nmap [q :cprev<cr>
nmap ]q :cnext<cr>
nmap [Q :cfirst<cr>
nmap ]Q :clast<cr>

map <silent> <F12> :!ctags .<cr>

"-----------------------------------------------------------------------------
" Encoding Menu settings
"-----------------------------------------------------------------------------
set fileencodings=utf-8,koi8-r
set wildmenu
set wcm=<Tab>
menu Encoding.koi8-r :e ++enc=koi8-r ++ff=unix<CR>
menu Encoding.windows-1251 :e ++enc=cp1251 ++ff=dos<CR>
menu Encoding.utf-8 :e ++enc=utf-8 ++ff=unix<CR>
map <F10> :emenu Encoding.<TAB>

" File Format Menu settings
"-----------------------------------------------------------------------------
menu FileFormat.unix :e ++ff=unix<CR>
menu FileFormat.dos :e ++ff=dos<CR>
map <F11> :emenu FileFormat.<TAB>

" Переключение на русский язык
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

" подсветка курсора
au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
au WinLeave * setlocal nocursorline

autocmd InsertEnter * hi CursorLine term=underline cterm=underline
autocmd InsertLeave * hi CursorLine term=none cterm=none

" решает проблему с распознованием строк в python
autocmd BufEnter * :syntax sync fromstart
" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufRead *.py match ExtraWhitespace /\s\+$/
autocmd BufEnter *.py match ExtraWhitespace /\s\+$/

" удаление концевых пробелов, табов и досовского завершения строк
autocmd BufRead *.py silent! %s/[\r \t]\+$//e
autocmd BufEnter *.py :%s/[ \t\r]\+$//e

" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on

" Showing line numbers and length
set number  " show line numbers
set tw=0   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
" Подсветка для столбца.. colorcolumn
hi ColorColumn ctermbg=239 guibg=#333333

" Useful settings
set history=700
set undolevels=700
set undofile  " persistent undo history
set undodir=~/.vim_undo

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" search
set hlsearch
set incsearch
set ignorecase
set smartcase

if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" search and replace world under cursor
noremap <Leader>s :%s/\<<C-r><C-w>\>/

" set visual bell
set novb

" Make sure that unsaved buffers that are to be put in the background are
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden
set bufhidden=wipe

" Always show a gutter
sign define dummy
autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')

" These things start comment lines
set comments=sl:/*,mb:\ *,ex:\ */,O://,b:#,:%,:XCOMM,n:>,fb:-

" Hide the mouse pointer while typing
set mousehide

" Edit the vimrc file
nmap <silent> ,ev :e $MYVIMRC<CR>

" нечитаемые символы
set list " Включить подсветку невидимых символов
set listchars+=tab:»\ ,trail:·,eol:↲

" command line
set laststatus=2
set ch=2 " Make command line two lines high
" Show the current command in the lower right corner
set showcmd

" abbr
ab todo: TODO:

" make scratch buffer
command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>
nmap <F4> :silent R python #<cr>
nmap <F14> :silent R ./pytest #<cr>

" tab for brackets
nnoremap <tab> %
vnoremap <tab> %


" tnoremap <Esc> <C-\><C-n>


if has('python')
python3 << EOF
import os.path
import sys
import vim

if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')

    exec(
        open(activate_this).read(),
        dict(__file__=activate_this)
    )
EOF
endif

autocmd FileType yaml setlocal ts=4 sts=4 shiftwidth=4 et
