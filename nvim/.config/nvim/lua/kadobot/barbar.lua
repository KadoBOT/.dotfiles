local opts = { noremap=true, silent=true }

vim.api.nvim_set_keymap('n', 'bP', ':BufferPrevious<CR>', opts)
vim.api.nvim_set_keymap('n', 'bN', ':BufferNext<CR>', opts)
vim.api.nvim_set_keymap('n', 'bC', ':BufferClose<CR>', opts)
vim.api.nvim_set_keymap('n', 'b1', ':BufferGoto 1<CR>', opts)
vim.api.nvim_set_keymap('n', 'b2', ':BufferGoto 2<CR>', opts)
vim.api.nvim_set_keymap('n', 'b3', ':BufferGoto 3<CR>', opts)
vim.api.nvim_set_keymap('n', 'b4', ':BufferGoto 4<CR>', opts)
vim.api.nvim_set_keymap('n', 'b5', ':BufferGoto 5<CR>', opts)
vim.api.nvim_set_keymap('n', 'b6', ':BufferGoto 6<CR>', opts)
vim.api.nvim_set_keymap('n', 'b7', ':BufferGoto 7<CR>', opts)
vim.api.nvim_set_keymap('n', 'b8', ':BufferGoto 8<CR>', opts)
vim.api.nvim_set_keymap('n', 'b9', ':BufferGoto 9<CR>', opts)

vim.g.bufferline = {
  icon_close_tab = '',
  icon_close_tab_modified = '',
  icon_separator_active = '',
  icon_separator_inactive = '',
}
