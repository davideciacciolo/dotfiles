" disable compatibility to old-time vi
set nocompatible

" show matching
set showmatch
" case insensitive search
set ignorecase
" highlight search
set hlsearch
" incremental search
set incsearch

" number of columns occupied by a tab
set tabstop=4
" see multiple spaces as tabstops so <BS> does the right thing
set softtabstop=4
" converts tabs to white space
set expandtab
" width for autoindents
set shiftwidth=4
" indent a new line the same amount as the line just typed
set autoindent

" add line numbers
set number
" set an 80 column border for good coding style
set colorcolumn=80
" highlight current cursorline
set cursorline
" speed up scrolling in Vim
set ttyfast
" set split positions
set splitright
set splitbelow

" get bash-like tab completions
set wildmode=longest,list
" using system clipboard
set clipboard=unnamedplus
" Directory to store backup files
set backupdir=~/.cache/vim 

" allow auto-indenting depending on file type
filetype plugin indent on
" syntax highlighting
syntax on
filetype plugin on

" AUTO COMMANDS
"
" Reload zsh when saving config file in (n)vim
autocmd bufwritepost ~/.config/zsh/.zshrc :silent !source ~/.config/zsh/.zshrc
" Reload i3WM when saving config file in (n)vim
autocmd bufwritepost ~/.config/i3/config :silent !i3-msg restart ; notify-send "i3WM was reloaded."

" PLUGINS
call plug#begin("~/.vim/plugged")
    " devicon support for nerdtree
    Plug 'ryanoasis/vim-devicons'
    " a file explorer for neovim
    Plug 'scrooloose/nerdtree'
    " an easy way for commenting out lines
    Plug 'preservim/nerdcommenter'
    " a really handy start page with lots of customizations
    Plug 'mhinz/vim-startify'
    " preview markdown on browser with synchronized scrolling and
    " flexible configuration
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
call plug#end()

" NERDCommenter
"
" Create default mappings
let g:NERDCreateDefaultMappings = 1
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code 
" indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" NERDTree
"
" Map the F3 key to toggle NERDTree open and close
nnoremap <F3> :NERDTreeToggle<CR>
" NERDTree must close if it's last buffer standing
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

