" HP Dietz's .vimrc

set nocompatible " vim only
set nomodeline " no modelines
set encoding=utf-8 " default encoding
set fileencoding=utf-8 " encode files in utf8
set t_Co=256 " 256 colors
set backspace=indent,eol,start " backspace moves accross these
set nobackup " do not keep a backup file
set noswapfile " do not keep a swap file
set undolevels=1000 " keep 1000 actions in undo history
set history=1000 " keep 1000 lines of command line history
set ruler " show the cursor position all the time
set showcmd " display incomplete commands
set incsearch " do incremental searching
set hidden " in memory buffers
set nowrap " do not wrap long lines
set tabstop=2 " tab width = 2 spaces
set shiftwidth=2 " shift width = 2 spaces
set softtabstop=2 " number of spaces that 'tab' counts for when editing
set expandtab " tab inserts spaces
set autoindent " inherit indents
set formatoptions=tcqr " autoformatting options: t: autowrap text using textwidth, c: autowrap comments, q: allow formatting of comments with gq, r automatically insert current comment leader
set copyindent " copy the structure of surrounding lines
set noshiftround " do not round indents to multiples of 'shiftwidth'
set showmatch " highlight matching brackets
set ignorecase " case insensitive search
set smartcase " if caps exist, be case sensitive
set smarttab " insert tabs in front of a line according to 'shiftwidth'
set noerrorbells " do not play a sound on error
set novisualbell " do not show visual error bells
set cursorline " highlight the cursorline
set nostartofline " move to the first non blank of the line
set cmdheight=1 " command line height
set list " show tabs in insert mode
set listchars=tab:>•,trail:•,extends:#,nbsp:• " strings to use in 'list'
set number " show line numbers
set ruler " show the line and column number of the cursor position
set showcmd " show partial command in the last line of the screen
set showmode " show the mode we're in
set laststatus=2 " always show a status line on the last window
set splitright " vsplit new window to right
set splitbelow " hsplit new window to bottom
set wildmenu " use completion menu
set wildignore=*~,*.o,*.so,*.obj,*.out " ignore these extensions in search list
set wildignore+=bower_components " exclude bower_components folder from search list
set wildignore+=node_modules " exclude node_modules folder from search list
set statusline="%f%m%r%h&w [%Y] [0x%02.2B]%< %F%=%4v,%41 %3p%% of %L" " show fileinfo in statusline
set statusline+=%#warningmsg# " show warnings in the status line
set statusline+=%{SyntasticStatuslineFlag()} " show syntastic status line flag
set statusline+=%* " set highlight group to user
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus " use system clipboard
endif
set rtp+=~/.vim/bundle/Vundle.vim " add vundle to runtime path
set nofoldenable " fold by indent, no big nesting
set foldmethod=indent " code folding by indentation
set foldnestmax=2 " maximum nesting level for folding
set foldlevel=1 " foldlevel for first line of fold

" Plugins
silent! call vundle#begin()
" Extensions
Plugin 'scrooloose/syntastic' " advanced syntax highlighting and linting
Plugin 'pangloss/vim-javascript' " extended javascript support
let javascript_enable_domhtmlcss=1 " enable HTML/CSS syntax highlighting
Plugin 'jelera/vim-javascript-syntax' " javascript syntax rules
Plugin 'nathanaelkane/vim-indent-guides' " show indentation guides
let g:indent_guides_enable_on_vim_startup=1 " enable indentation guides on startup
let g:indent_guides_auto_colors=0 " disable autodiscovery of guide colors to fix colorscheme definitions
Plugin 'Raimondi/delimitMate' " auto close brackets and quotes
let delimitMate_expand_cr=1 " autoexpand carriage return
let g:syntastic_check_on_open=1 " check syntax when opening a file
let g:syntastic_javascript_checkers=['jscs'] " js linters
Plugin 'Chiel92/vim-autoformat' " autoformatting
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'helino/vim-json' " enhanced JSON support
Plugin 'ap/vim-css-color' " Preview colors in source code
Plugin 'suan/vim-instant-markdown' " Preview markdown in the browser
Plugin 'dkprice/vim-easygrep' " grep extension
let g:EasyGrepFilesToExclude='bower_components,node_modules,.git,.tmp,packages' " files to exclude from grep
let g:EasyGrepCommand=1 " use grep
let g:EasyGrepRecursive=1 " grep recursively
let g:EasyGrepSearchCurrentBufferDir=1 " start searching in current buffer first
Plugin 'terryma/vim-smooth-scroll' " smooth scrolling in vim
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 20, 1)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll,20, 1)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 20, 2)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 20, 2)<CR>
Plugin 'ekalinin/Dockerfile.vim' " Add docker syntax highlighting
Plugin 'scrooloose/nerdtree' " tree explorer
Plugin 'Xuyuanp/nerdtree-git-plugin' " add git support to nerdtree
Plugin 'vim-airline/vim-airline' " add fancy status bars
Plugin 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline_theme='solarized'
Plugin 'tpope/vim-fugitive' " extended git support

" Color schemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'haensl/mustang-vim'
silent! call vundle#end()

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on " enable syntax highlighting
  set hlsearch " highlight search results
  set background=dark
  colorscheme solarized
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
          \ if line("'\"") > 1 && line("'\"") <= line("$") |
          \   exe "normal! g`\"" |
          \ endif

  augroup END

else

  set autoindent " always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif
