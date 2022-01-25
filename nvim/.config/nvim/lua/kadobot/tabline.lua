local wk = require('which-key')

vim.cmd[[
set guioptions-=e " Use showtabline in gui vim
set sessionoptions+=tabpages,globals " store tabpages and globals in session
]]

require'tabline'.setup {
    -- Defaults configuration options
    enable = true,
    options = {
        -- If lualine is installed tabline will use separators configured in lualine by default.
        max_bufferline_percent = nil, -- set to nil by default, and it uses vim.o.columns * 2/3
        show_tabs_always = false, -- this shows tabs only when there are more than one tab or if the first tab is named
        show_devicons = true, -- this shows devicons in buffer section
        show_bufnr = false, -- this appends [bufnr] to buffer section,
        show_filename_only = true, -- shows base filename only instead of relative path in filename
    }
}

wk.register({
    name = "Buffer",
    ['p'] = { '<cmd>TablineBufferPrevious<cr>', "Previous Buffer" },
    ['n'] = { '<cmd>TablineBufferNext<cr>', "Next Buffer" },
    ['c'] = { ':bd<CR>', "Close Buffer" },
}, { prefix = "<leader>b" })

wk.register({
  ['<C-p>'] = { '<cmd>TablineBufferPrevious<cr>', "Previous Buffer" },
  ['<C-n>'] = { '<cmd>TablineBufferNext<cr>', "Next Buffer" },
  ['<C-g>'] = { ':tabprev<cr>', "Previous Tab" },
  ['<C-y>'] = { ':tabnext<cr>', "Next Tab" },
})
