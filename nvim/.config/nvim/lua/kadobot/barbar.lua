local wk = require('which-key')

wk.register({
    name = "Buffer",
    ['p'] = { ':BufferPrevious<CR>', "Previous Buffer" },
    ['n'] = { ':BufferNext<CR>', "Next Buffer" },
    ['c'] = { ':BufferClose<CR>', "Close Buffer" },
    ['1'] = { ':BufferGoto 1<CR>', "Buffer 1" },
    ['2'] = { ':BufferGoto 2<CR>', "Buffer 2" },
    ['3'] = { ':BufferGoto 3<CR>', "Buffer 3" },
    ['4'] = { ':BufferGoto 4<CR>', "Buffer 4" },
    ['5'] = { ':BufferGoto 5<CR>', "Buffer 5" },
    ['6'] = { ':BufferGoto 6<CR>', "Buffer 6" },
    ['7'] = { ':BufferGoto 7<CR>', "Buffer 7" },
    ['8'] = { ':BufferGoto 8<CR>', "Buffer 8" },
    ['9'] = { ':BufferGoto 9<CR>', "Buffer 9" }
}, { prefix = "<leader>b" })

wk.register({
  ['<C-p>'] = { ':BufferPrevious<CR>', "Previous Buffer" },
  ['<C-n>'] = { ':BufferNext<CR>', "Next Buffer" },
})

vim.g.bufferline = {
  icon_close_tab = '',
  icon_close_tab_modified = '',
  icon_separator_active = '⏽',
  icon_separator_inactive = '',
}
