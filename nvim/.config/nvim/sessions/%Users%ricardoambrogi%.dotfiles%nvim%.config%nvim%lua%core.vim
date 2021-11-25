let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.dotfiles
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
edit nvim/.config/nvim/lua/core/plugins.lua
argglobal
balt nvim/.config/nvim/lua/core/settings.lua
let s:l = 118 - ((59 * winheight(0) + 36) / 72)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 118
normal! 05|
lcd ~/.dotfiles/nvim/.config/nvim/lua/core
tabnext 1
badd +64 ~/.dotfiles/nvim/.config/nvim/lua/kadobot/telescope.lua
badd +118 ~/.dotfiles/nvim/.config/nvim/lua/core/plugins.lua
badd +51 ~/.dotfiles/nvim/.config/nvim/lua/core/settings.lua
badd +113 ~/.dotfiles/nvim/.config/nvim/lua/kadobot/lsp.lua
badd +9 ~/.dotfiles/nvim/.config/nvim/lua/kadobot/telescope_setup.lua
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=atToOFcI
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
