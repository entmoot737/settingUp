"Entmoot737's .vimrc file

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
Plug 'vim-airline/vim-airline'
Plug 'maralla/completor.vim'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'maralla/completor.vim', { 'do': 'make js' }
call plug#end()

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Yggdroot/indentline' "add indent lines
Plugin 'octol/vim-cpp-enhanced-highlight'
"Plugin 'codota/tabnine-vim'
call vundle#end()

"enable syntax highlighting
set syntax=on

" Working with autocompletion settings
" Use TAB to complete when typing words, else inserts TABs as usual.  Uses
" dictionary, source files, and completor to find matching words to complete.

" Note: usual completion is on <C-n> but more trouble to press all the time.
" Never type the same word twice and maybe learn a new spellings!
" Use the Linux dictionary when spelling is in doubt.
function! Tab_Or_Complete() abort
  " If completor is already open the `tab` cycles through suggested completions.
  if pumvisible()
    return "\<C-N>"
  " If completor is not open and we are in the middle of typing a word then
  " `tab` opens completor menu.
  elseif col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^[[:keyword:][:ident:]]'
    return "\<C-R>=completor#do('complete')\<CR>"
  else
    " If we aren't typing a word and we press `tab` simply do the normal `tab`
    " action.
    return "\<Tab>"
  endif
endfunction

" Use `tab` key to select completions.  Default is arrow keys.
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use tab to trigger auto completion.  Default suggests completions as you type.
" let g:completor_auto_trigger = 0
" inoremap <expr> <Tab> Tab_Or_Complete()
" Adding C++ functionality
let g:completor_clang_binary = '/usr/bin/clang'

" Done with autocompletion config

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
nmap j gj
nmap k gk

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
inoremap {<CR>  {<CR>}<Esc>O

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
set spellfile=~/.vim/spell/en.utf-8.add

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
"set textwidth=100
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
