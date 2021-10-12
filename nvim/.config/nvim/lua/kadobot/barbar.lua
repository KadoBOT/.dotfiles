local opts = { noremap=true, silent=true }

vim.api.nvim_set_keymap('n', '<space>bp', ':BufferPrevious<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>bn', ':BufferNext<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>bc', ':BufferClose<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>b1', ':BufferGoto 1<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>b2', ':BufferGoto 2<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>b3', ':BufferGoto 3<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>b4', ':BufferGoto 4<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>b5', ':BufferGoto 5<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>b6', ':BufferGoto 6<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>b7', ':BufferGoto 7<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>b8', ':BufferGoto 8<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>b9', ':BufferGoto 9<CR>', opts)

vim.g.bufferline = {
  icon_close_tab = '',
  icon_close_tab_modified = '',
  icon_separator_active = '',
  icon_separator_inactive = '',
}
