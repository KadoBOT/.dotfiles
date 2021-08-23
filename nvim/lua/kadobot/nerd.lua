vim.g.NERDCreateDefaultMappings = 0

vim.api.nvim_set_keymap('n', '<C-_>', '<Plug>NERDCommenterToggle', {})
vim.api.nvim_set_keymap('v', '<C-_>', '<Plug>NERDCommenterToggle<CR>gv', {})
vim.api.nvim_set_keymap('n', '<space>n$', '<Plug>NERDCommenterToEOL<CR>', {})
vim.api.nvim_set_keymap('n', '<space>nA', '<Plug>NERDCommenterAppend<CR>', {})
vim.api.nvim_set_keymap('n', '<space>nb', '<Plug>NERDCommenterAlignBoth<CR>', {})
vim.api.nvim_set_keymap('n', '<space>nc', '<Plug>NERDCommenterComment<CR>', {})
vim.api.nvim_set_keymap('n', '<space>nl', '<Plug>NERDCommenterAlignLeft<CR>', {})
vim.api.nvim_set_keymap('n', '<space>nm', '<Plug>NERDCommenterMinimal<CR>', {})
vim.api.nvim_set_keymap('n', '<space>nn', '<Plug>NERDCommenterNested<CR>', {})
vim.api.nvim_set_keymap('n', '<space>ni', '<Plug>NERDCommenterInvert<CR>', {})
vim.api.nvim_set_keymap('n', '<space>ns', '<Plug>NERDCommenterSexy<CR>', {})
vim.api.nvim_set_keymap('n', '<space>ny', '<Plug>NERDCommenterYank<CR>', {})
vim.api.nvim_set_keymap('n', '<space>nu', '<Plug>NERDCommenterUncomment<CR>', {})
