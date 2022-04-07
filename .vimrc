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

set shiftwidth=4  " Set shift width to 4 spaces.
set tabstop=4  " Set tab width to 4 columns.
set expandtab  " Use space characters instead of tabs.

set incsearch  " While searching incrementally highlight matching characters
               " as you type
set ignorecase  " Ignore capital letters during search
set smartcase  " Override ignorecase if searching for capital letters
set showmatch  " Show matching words during a search
set hlsearch  " Use highlighting when doing a search

set cursorline
set colorcolumn=80
set number
set showcmd  " Show partial command you type in the last line of the screen
set showmode  " Show the mode you are on the last line of the screen
set scrolloff=10  " Do not let cursor scroll below or above N number of lines
                  " when scrolling
set nowrap  " Do not wrap lines
set splitbelow
set splitright

colorscheme molokai

set wildmenu  " Enable auto completion menu after pressing TAB
set wildmode=list:longest  " Make wildmenu behave like Bash autocompletion
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

set history=1000  " Set the commands to save in history (default is 20)
set nobackup  " Do not save backup files

" Enable marker method of folding
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" If current filetype is HTML, set indentation to 2 spaces.
autocmd Filetype html setlocal tabstop=2 shiftwidth=2

" If Vim version is equal to or greater than 7.3 enable undofile
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif

" }}}

" STATUS LINE ------------------------------------------------------------- {{{

" Clear status line when vimrc is reloaded
set statusline=

" Status line left side
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side
set statusline+=%=

" Status line right side
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line
set laststatus=2

" }}}

