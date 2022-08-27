set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set spell                 " enable spell check (may need to download
set noswapfile            " disable creating swap file
set backupdir=~/.cache/vim " Directory to store backup files.
filetype on "filetype detection 
filetype plugin indent on "filetype-based indentation 
set tabstop=4 expandtab shiftwidth=4 softtabstop=4 "python-compatible tab setup 
" set tabstop=2 expandtab shiftwidth=2 softtabstop=2 "python-compatible tab setup 
set foldmethod=indent foldlevel=99 "python-compatible folding
"set number "line numbers
set relativenumber
set cursorline
set incsearch
set hlsearch
"fix backspace error
set backspace=indent,eol,start
"icons
set encoding=utf8
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11

" set rtp+=~/Users/placeit/.vim/bundle/tabnine-vim

"End key fix
nmap <Esc>OF $
imap <Esc>OF <esc>$a
cmap <Esc>OF <End>
"Home key fix
nmap <Esc>OH <Esc>01
imap <Esc>OH <Home>
cmap <Esc>OF 0

" Backup Dir
set backupdir=~/.vimtmp

call plug#begin('~/.config/nvim/plugged')
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wilywampa/vim-commentary'
Plug 'ap/vim-css-color'
Plug 'terryma/vim-multiple-cursors'
Plug 'kshenoy/vim-signature'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-unimpaired'
Plug 'ayu-theme/ayu-vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'nvim-lua/popup.nvim'

" LSP
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }

" Completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'windwp/nvim-ts-autotag'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'
call plug#end()

" TELESCOPE CONFIG
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>gg <cmd>Telescope live_grep<cr>
nnoremap <leader>bb <cmd>Telescope buffers<cr>

" UI THEME
set termguicolors
let ayucolor="dark"
colorscheme ayu
highlight LineNr guibg=black
highlight LineNr guifg=orange

" AIRLINE CONFIG
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'jellybeans'

" SHORTCUTS
let g:relative_number_toggle = 1
function RelativeNumberToggle()
    if g:relative_number_toggle == 0
        let g:relative_number_toggle = 1
        set relativenumber
    else
        let g:relative_number_toggle = 0
        set norelativenumber
    endif
endfunction

command! RelativeNumberToggle call RelativeNumberToggle()
nnoremap <C-r> <Esc> :RelativeNumberToggle<CR>

" COPY ELEMENTS
nmap <leader>y V"*y
vmap <leader>Y "*y
nmap <leader>P "*p

autocmd Filetype css,scss,sass setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
autocmd Filetype go setlocal noet ci pi sts=0 sw=4 ts=4

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" lsp
lua << EOF
require 'cmp-config'
require 'lsp-servers-config'
require 'treesitter-config'
require 'saga-config'
EOF
