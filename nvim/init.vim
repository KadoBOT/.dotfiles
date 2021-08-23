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
set smartcase

" Text Rendering
set display+=lastline
set encoding=utf-8
set linebreak
set scrolloff=8
set sidescrolloff=5
set sidescroll=8
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
set confirm
set noswapfile
set hidden
set formatoptions+=j
set nomodeline
set nrformats-=octal
set shell=/usr/bin/zsh
set clipboard=unnamedplus
set completeopt=menuone,noinsert,noselect
set shortmess+=c
set showmode
set showmatch
set nostartofline
set timeoutlen=500
set cursorline

let g:ale_disable_lsp = 1

let g:ale_emit_conflict_warnings = 1
let g:ale_echo_msg_format = '[%severity%] %s [%linter%]'
let g:ale_sign_error      = ''
let g:ale_sign_warning    = 'ﲍ'
let g:ale_sign_info       = 'ﯦ'
let g:ale_fix_on_save     = 1
let g:ale_sign_column_always = 1
let g:ale_echo_msg_format = '%code: %%s [%linter%]'
let g:ale_virtualtext_cursor = 0

call plug#begin('~/.vim/plugged')
Plug 'hoob3rt/lualine.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground',
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'neovim/nvim-lspconfig'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'
Plug 'ryanoasis/vim-devicons'
Plug 'SirVer/ultisnips'
Plug 'hrsh7th/nvim-compe'
Plug 'dense-analysis/ale'
Plug 'liuchengxu/vim-which-key'
Plug 'mhinz/vim-startify'
Plug 'ap/vim-css-color'
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'glepnir/lspsaga.nvim'
Plug 'ray-x/lsp_signature.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'airblade/vim-gitgutter'
call plug#end()

" configure nvcode-color-schemes
let g:nvcode_termcolors=256

colorscheme breakingbad

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
highlight LineNr guifg=#160C2F guibg=None
highlight CursorLineNr guifg=#1A1035 guibg=#120828
highlight CursorLine guibg=#120828
highlight SignColumn guibg=#0F0623

highlight ALEError   guifg=#D5757C
highlight ALEWarning guifg=#F8B8B7
highlight ALEInfo    guifg=#DFE0F0
highlight ALEErrorSign guifg=#D5757C
highlight ALEWarningSign guifg=#F8B8B7


nnoremap <leader>wv <C-w>v
nnoremap <leader>wh <C-w>s
nnoremap <leader>wc <C-w>q
vnoremap <leader>y "*y
vnoremap <leader>Y "+y
nnoremap <leader>p "*p
nnoremap <leader>P "+p
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
nnoremap <leader>tu :UndotreeShow<CR>
nnoremap <leader><leader> <c-^>
nmap <space>ghs <Plug>(GitGutterStageHunk)
nmap <space>ghu <Plug>(GitGutterUndoHunk)
nmap <space>ghp <Plug>(GitGutterPreviewHunk)

" Config
lua << EOF
require('kadobot')
EOF

 "ALE (Asynchronous Lint Engine)
let g:ale_fixers = {
 \ 'javascript': ['eslint'],
 \ 'go': ['goimports', 'golines', 'gofmt']
 \ }
let g:ale_linters = {
 \ 'go': ['golangci-lint']
 \ }

let g:ale_go_goimports_executable = 'gofumports'
let g:ale_go_gofmt_executable = 'gofumpt'
let g:ale_go_gofmt_options = '-s'
let g:ale_go_golangci_lint_package = 1
let g:ale_go_golangci_lint_options = ''
\   . ' --exclude-use-default'
\   . ' --out-format=line-number'
\   . ' --tests'
\   . ' --print-issued-lines=false'
\   . ' --disable-all'
\   . ' --enable=bodyclose'
\   . ' --enable=deadcode'
\   . ' --enable=errcheck'
\   . ' --enable=golint'
\   . ' --enable=gosec'
\   . ' --enable=ineffassign'
\   . ' --enable=interfacer'
\   . ' --enable=megacheck'
\   . ' --enable=misspell'
\   . ' --enable=prealloc'
\   . ' --enable=scopelint'
\   . ' --enable=structcheck'
\   . ' --enable=unconvert'
\   . ' --enable=unparam'
\   . ' --enable=varcheck'
\   . ' --enable=whitespace'
