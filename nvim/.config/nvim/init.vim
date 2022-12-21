filetype plugin indent on
let mapleader=" "

" Config
lua require('kadobot')

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

if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

nnoremap n nzz

nnoremap <down> :m .+1<CR>==
nnoremap <up> :m .-2<CR>==
inoremap <down> <ESC>:m .+1<CR>==gi
inoremap <up> <ESC>:m .-2<CR>==gi
vnoremap <down> :m '>+1<CR>gv=gv
vnoremap <up> :m '<-2<CR>gv=gv

" noremap kF zF
" noremap kd zd
" noremap kD zD
" noremap kE zE
" noremap ko zo
" noremap kO zO
" noremap kc zc
" noremap kC zC
" noremap ka za
" noremap kA zA
" noremap kv zv
" noremap kx zx
" noremap kX zX
" noremap km zm
" noremap kM zM
" noremap kr zR
" noremap kn zn
" noremap kN zN
" noremap ki zi
" noremap kh zj
" noremap kj zk

noremap l <Left>
noremap h <Down>
noremap j <Up>
noremap z <Right>
noremap k z

set guifont=DankMono\ Nerd\ Font:h16
