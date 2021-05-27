"Peter Garud's .vimrc file

"wards off unexpected things that distro might have made,
"as well as reseting options when re-sroucing .vimrc
set nocompatible  

"attempts to determine file type based on name and possibly its contents
"allows intelligent auto-indenting for each filetype, and for plugins 
"that are filetype specific
if has('filetype')
    filetype indent plugin on
endif

"plugins start here
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree' "file structure
Plug 'preservim/nerdcommenter' "comment easier
Plug 'Valloric/YouCompleteMe'
Plug 'vim-airline/vim-airline'
call plug#end()

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Yggdroot/indentline' "add indent lines
call vundle#end()

"enable syntax highlighting
set syntax=on

"show stuff on status line
"set showmode
"set showcmd

"Security
set modelines=0

"better command-line completion
set wildmenu

"redraw screen only when need to
set lazyredraw

"highlight matching parentheses/brackets
set showmatch

"move vertically by visual line (don't skip wrapped lines)
"nmap j gj
"nmap k gk

"show partial commands in last line of the screen
""always show statusline"
set showcmd
"set laststatus=2 

"changes leader key to comma from \
let mapleader = "," 

"automatically create matching end characters
inoremap        (  ()<Left>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap <expr> " strpart(getline("."), col(".")-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"

"open nerdtree easier
nnoremap <leader>t :NERDTreeToggle<CR>

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror

"change windows easier
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>

"able to switch windows without saving first
set hidden

"highlight searches (use <C-L> to temporarily turn off highlighting)
set hlsearch

"use case insensitive search, except when using capital letters
set ignorecase
set smartcase

"allow backspacing over autoindent, line breaks, and start of insert action
set backspace=indent,eol,start

"when opening new line and no filetype-specific indenting enabled, keep
"same indent as line currently on. Useful for READMEs
set autoindent

"display cursor position on last line of screen or in status line of a window
set ruler

"instead of failing a command b/c of unsaved changes, instead raise a dialogue
"asking if you wish to save changed files
set confirm

"use visual bell instead of beeping when doing something wrong
set visualbell

"to use spell check
set spelllang=en_us
set spellfile=~/Dropbox/Vim/Language/en.utf-8.add

"And reset terminal code for visual bell. If visualbell is set, vim will neither
"flash nor beep. If visualbell is unset, this does nothing
set t_vb=

"enable use of mouse for all modes
if has ('mouse')
    set mouse=a
endif

"set command window hieght to 2 lines, to avoid many cases of having to press 
"<Enter> to continue
set cmdheight=2

"display line numbers on the left
set number

"quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

"indentation settings for using 4 spaces instead of tabs.
"Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab

"map <C-L> (redraw screen) to also turn off search highlighting until next search
nnoremap <C-a> :nohl<CR>

"remap <ESC> to jk 
inoremap jj <ESC> 

"make encoding utf-8
set encoding=utf-8

"gets rid of beeping sound
set noerrorbells

"disable the swapfile
set noswapfile " disable the swapfile

"show serach results as you type
set incsearch

"set colorscheme
colo rdark-terminal2

"use smart indenting
set smartindent

"use smarttabs
set smarttab

" wrap lines when get to end of window or not
set wrap
set textwidth=100
"set nowrap

"make column on right side for end of text
set colorcolumn=101
highlight ColorColumn ctermbg=0 guibg=lightgrey

"don't back up files
"set nobackup

"make an undo directory for undos
"set undodir=~/.vim/undodir

"make undofiles
"set undofile

"make background dark mode
set background=dark

"keep at least 5 lines above/below cursor
set scrolloff=5

"hide mouse when typing
set mousehide

"autoreload the file in Vim if it has been changed outside of Vim
set autoread

"highlight current line
set cursorline

"on statusline full filepath displayed on left, on right file modified?,
"filetype, line number, percentage through file
"set statusline=%.40F%=%m\ %Y\ Line:\ %3l/%L[%3p%%]

