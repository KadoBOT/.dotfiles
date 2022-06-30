local Hydra = require('hydra')

Hydra({
   hint = [[
 ^^^^^^     Move     ^^^^^^   ^^     Split         ^^^^    Size
 ^^^^^^--------------^^^^^^   ^^---------------    ^^^^------------- 
 ^ ^ _j_ ^ ^   ^ ^ _J_ ^ ^    _s_: horizontally    _+_ _-_: height
 _l_ ^ ^ _z_   _L_ ^ ^ _Z_    _v_: vertically      _>_ _<_: width
 ^ ^ _h_ ^ ^   ^ ^ _H_ ^ ^    _q_: close           ^ _=_ ^: equalize
 focus^^^^^^   window^^^^^^
 ^ ^ ^ ^ ^ ^   ^ ^ ^ ^ ^ ^    _b_: choose buffer   ^ ^ ^ ^    _<Esc>_
]],
   config = {
      hint = {
         border = 'rounded'
      }
   },
   mode = 'n',
   body = '<C-w>',
   heads = {
      -- Move focus
      { 'l', '<C-w>h' },
      { 'h', '<C-w>j' },
      { 'j', '<C-w>k' },
      { 'z', '<C-w>l' },
      -- Move window
      { 'L', '<Cmd>WinShift left<CR>' },
      { 'H', '<Cmd>WinShift down<CR>' },
      { 'J', '<Cmd>WinShift up<CR>' },
      { 'Z', '<Cmd>WinShift right<CR>' },
      -- Split
      { 's', '<C-w>s' },
      { 'v', '<C-w>v' },
      { 'q', '<Cmd>try | close | catch | endtry<CR>', { desc = 'close window' } },
      -- Size
      { '+', '<C-w>+' },
      { '-', '<C-w>-' },
      { '>', '2<C-w>>', { desc = 'increase width' } },
      { '<', '2<C-w><', { desc = 'decrease width' } },
      { '=', '<C-w>=', { desc = 'equalize'} },
      --
      { 'b', '<Cmd>BufExplorer<CR>', { exit = true, desc = 'choose buffer' } },
      { '<Esc>', nil,  { exit = true }}
   }
})
