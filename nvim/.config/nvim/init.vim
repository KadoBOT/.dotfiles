syntax enable
syntax on

filetype plugin indent on
let mapleader=" "

" Indent
set autoindent
set expandtab
set shiftround
set shiftwidth=4
set smarttab
set tabstop=4
set smartindent

" Search
set nohlsearch
set ignorecase
set incsearch
set inccommand=nosplit
set smartcase

" Text Rendering
set display+=lastline
set encoding=utf-8
set linebreak
set scrolloff=12
set sidescrolloff=7
set sidescroll=12
set nowrap
set spell
set spelllang=en_us

" UI
set laststatus=2
set ruler
set wildmenu wildmode=full,list:longest
set number
set relativenumber
set noerrorbells
set visualbell
set mouse=a
set title
set background=dark
set splitright
set splitbelow

" Fold
set foldmethod=indent
set foldnestmax=3
set nofoldenable

" Misc
set nobomb
set autoread
set backspace=indent,eol,start
set nobackup
set nowritebackup
set confirm
set noswapfile
set hidden
set formatoptions+=j
set nomodeline
set nrformats-=octal
set shell=/bin/zsh
set clipboard=unnamedplus
set completeopt=menuone,noinsert,noselect
set shortmess+=c
set showmode
set showmatch
set nostartofline
set timeoutlen=500
set cursorline
set updatetime=100
set listchars=tab:>·,trail:~,extends:>,precedes:<,space:·
set list

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'arcticicestudio/nord-vim'
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'DataWraith/auto_mkdir'
Plug 'folke/trouble.nvim'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'liuchengxu/vim-which-key'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-startify'
Plug 'neovim/nvim-lspconfig'
Plug 'NTBBloodbath/doom-one.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope-frecency.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'nvim-treesitter/playground',
Plug 'onsails/lspkind-nvim'
Plug 'phaazon/hop.nvim'
Plug 'prettier/vim-prettier'
Plug 'psliwka/vim-smoothie'
Plug 'Raimondi/delimitMate'
Plug 'ray-x/lsp_signature.nvim'
Plug 'romgrk/barbar.nvim'
Plug 'sheerun/vim-polyglot'
Plug 'tami5/sql.nvim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'weilbith/nvim-code-action-menu'
Plug 'Yggdroot/indentLine'
call plug#end()

" indentLine indent char
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" configure nvcode-color-schemes
let g:nvcode_termcolors=256

colorscheme doom-one

if has("persistent_undo")
   let target_path = expand('~/.undodir')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif

set termguicolors

nnoremap <leader>wv <C-w>v
nnoremap <leader>wh <C-w>s
nnoremap <leader>wc <C-w>q
nnoremap <leader>w+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <leader>w- :exe "resize " . (winheight(0) * 2/3)<CR>
vnoremap <leader>y "*y
vnoremap <leader>Y "+y
nnoremap <leader>p "*p
nnoremap <leader>P "+p
nnoremap <M-h> :m .+1<CR>==
nnoremap <M-j> :m .-2<CR>==
inoremap <M-h> <ESC>:m .+1<CR>==gi
inoremap <M-j> <ESC>:m .-2<CR>==gi
vnoremap <M-h> :m '>+1<CR>gv=gv
vnoremap <M-j> :m '<-2<CR>gv=gv
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
nnoremap <leader>tu :UndotreeShow<CR>
nnoremap <leader><leader> <c-^>
nmap <leader>ghs <Plug>(GitGutterStageHunk)
nmap <leader>ghu <Plug>(GitGutterUndoHunk)
nmap <leader>ghp <Plug>(GitGutterPreviewHunk)

noremap l <Left>
noremap h <Down>
noremap j <Up>
noremap z <Right>

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-l> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-h> :TmuxNavigateDown<cr>
nnoremap <silent> <C-j> :TmuxNavigateUp<cr>
nnoremap <silent> <C-z> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>

" Config
lua require('kadobot')
