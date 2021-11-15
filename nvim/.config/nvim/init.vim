filetype plugin indent on
let mapleader=" "

" Config
lua require('kadobot')

" indentLine indent char
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2

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

nnoremap n nzz

nnoremap <down> :m .+1<CR>==
nnoremap <up> :m .-2<CR>==
inoremap <down> <ESC>:m .+1<CR>==gi
inoremap <up> <ESC>:m .-2<CR>==gi
vnoremap <down> :m '>+1<CR>gv=gv
vnoremap <up> :m '<-2<CR>gv=gv

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
