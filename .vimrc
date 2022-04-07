set nocompatible

filetype plugin indent on
syntax on

" PLUGINS ----------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')

    Plug 'preservim/nerdtree'

    Plug 'airblade/vim-gitgutter'
    Plug 'itchyny/lightline.vim'

    Plug 'mattn/emmet-vim'
    Plug 'tpope/vim-surround'

    Plug 'w0rp/ale'

    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() },'for': ['markdown', 'vim-plug']}

call plug#end()

" }}}

" MAPPINGS ---------------------------------------------------------------- {{{

" Turn off search highlighting by pressing \\
nnoremap <leader>\ :nohlsearch<CR>

" NERDTree specific mappings
" Map the F3 key to toggle NERDTree open and close
nnoremap <F3> :NERDTreeToggle<CR>

" }}}

" VIMSCRIPT --------------------------------------------------------------- {{{

" Formatting

set nowrap  " Do not wrap long lines
set autoindent  " Indent at the same level of the previous line
set shiftwidth=4  " Set shift width to 4 spaces.
set expandtab  " Use space characters instead of tabs.
set tabstop=4  " Set tab width to 4 columns.
set softtabstop=4  " Let backspace delete indent

" Search 

set incsearch  " While searching incrementally highlight matching characters
               " as you type
set ignorecase  " Ignore capital letters during search
set smartcase  " Override ignorecase if searching for capital letters
set showmatch  " Show matching words during a search
set hlsearch  " Use highlighting when doing a search

"UI

set cursorline
set colorcolumn=80
set number
set showcmd  " Show partial command you type in the last line of the screen
set showmode  " Show the mode you are on the last line of the screen
set scrolloff=10  " Do not let cursor scroll below or above N number of lines
                  " when scrolling
set tabpagemax=15  " Only show 15 tabs
set splitbelow
set splitright

colorscheme molokai

set wildmenu  " Enable auto completion menu after pressing TAB
set wildmode=list:longest  " Make wildmenu behave like Bash autocompletion
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

set history=1000  " Set the commands to save in history (default is 20)
set nobackup  " Do not save backup files

" Filetype-specific settings

" Enable marker method of folding
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" If current filetype is HTML, set indentation to 2 spaces.
autocmd Filetype html setlocal tabstop=2 shiftwidth=2

" Plugins settings
" NERDTree must close if it's last buffer standing
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" If Vim version is equal to or greater than 7.3 enable undofile
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif

" }}}

" STATUS LINE ------------------------------------------------------------- {{{

if has('statusline')
    " Show the status on the second to last line
    set laststatus=2

    set statusline=%<%f\                     " Filename
    set statusline+=%w%h%m%r                 " Options
    set statusline+=\ [%{&ff}/%Y]            " Filetype
    set statusline+=\ [%{getcwd()}]          " Current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info

endif

" }}}

