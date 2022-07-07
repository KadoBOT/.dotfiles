local Hydra = require('hydra')
local gitsigns = require('gitsigns')

local hint = [[
 _H_: next hunk      _s_: stage hunk        _d_: show deleted   _b_: blame line
 _J_: prev hunk      _u_: undo stage hunk   _p_: preview hunk   _B_: blame show full 
 _R_: reset buffer   _S_: stage buffer      _r_: reset hunk     _/_: show base file
 ^
 ^ ^              _<Enter>_: Neogit              _q_: exit
]]

Hydra({
   hint = hint,
   config = {
      color = 'pink',
      invoke_on_body = true,
      hint = {
         position = 'bottom',
         border = 'rounded'
      },
      on_enter = function()
         vim.bo.modifiable = false
         gitsigns.toggle_signs(true)
         gitsigns.toggle_linehl(true)
      end,
      on_exit = function()
         gitsigns.toggle_signs(false)
         gitsigns.toggle_linehl(false)
         gitsigns.toggle_deleted(false)
         vim.cmd 'echo' -- clear the echo area
      end
   },
   mode = {'n','x'},
   body = '<C-g>',
   heads = {
      { 'H', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gitsigns.next_hunk() end)
            return '<Ignore>'
         end, { expr = true } },
      { 'J', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gitsigns.prev_hunk() end)
            return '<Ignore>'
         end, { expr = true } },
      { 's', ':Gitsigns stage_hunk<CR>', { silent = true } },
      { 'u', gitsigns.undo_stage_hunk },
      { 'S', gitsigns.stage_buffer },
      { 'p', gitsigns.preview_hunk },
      { 'd', gitsigns.toggle_deleted, { nowait = true } },
      { 'b', gitsigns.blame_line },
      { 'B', function() gitsigns.blame_line{ full = true } end },
      { '/', gitsigns.show, { exit = true } }, -- show the base of the file
      { '<Enter>', '<cmd>Neogit<CR>', { exit = true } },
      { 'q', nil, { exit = true, nowait = true } },
      { 'r', gitsigns.reset_hunk, { nowait = true } },
      { 'R', gitsigns.reset_buffer, { nowait = true } },
   }
})
