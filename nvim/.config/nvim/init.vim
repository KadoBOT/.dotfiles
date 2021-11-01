syntax enable
syntax on

filetype plugin indent on
let mapleader=" "

set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set clipboard=unnamedplus
set completeopt=menuone,noinsert,noselect
set confirm
set cursorline
set display+=lastline
set encoding=utf-8
set expandtab
set foldmethod=indent
set foldnestmax=3
set formatoptions+=j
set hidden
set ignorecase
set inccommand=nosplit
set incsearch
set laststatus=2
set linebreak
set list
set listchars=tab:>·,trail:~,extends:>,precedes:<,space:·
set mouse=a
set nobackup
set nobomb
set noerrorbells
set nofoldenable
set nohlsearch
set nomodeline
set nostartofline
set noswapfile
set nowrap
set number
set nowritebackup
set nrformats-=octal
set norelativenumber
set numberwidth=2
set noruler
set scrolloff=12
set shell=/bin/zsh
set shiftround
set shiftwidth=2
set shortmess+=c
set showmatch
set showmode
set sidescroll=12
set sidescrolloff=7
set smartcase
set smartindent
set smarttab
set spell
set spelllang=en_us
set splitbelow
set splitright
set tabstop=8
set timeoutlen=0
set title
set updatetime=100
set visualbell
set wildmenu wildmode=full,list:longest

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'arcticicestudio/nord-vim'
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'DataWraith/auto_mkdir'
Plug 'folke/trouble.nvim'
Plug 'folke/which-key.nvim'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'kyazdani42/nvim-web-devicons'
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
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase'}
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
nnoremap <down> :m .+1<CR>==
nnoremap <up> :m .-2<CR>==
inoremap <down> <ESC>:m .+1<CR>==gi
inoremap <up> <ESC>:m .-2<CR>==gi
vnoremap <down> :m '>+1<CR>gv=gv
vnoremap <up> :m '<-2<CR>gv=gv
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

" Wrap selection with '' 
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>
" Wrap selection with ""
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>
" Wrap selection with ()
vnoremap <leader>( <esc>`>a)<esc>`<i(<esc>
" Wrap selection with []
vnoremap <leader>[ <esc>`>a]<esc>`<i[<esc>
" Wrap selection with {}
vnoremap <leader>{ <esc>`>a}<esc>`<i{<esc>

let g:Hexokinase_highlighters = ['virtual']

" Config
lua require('kadobot')
