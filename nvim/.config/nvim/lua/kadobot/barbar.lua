local opts = { noremap=true, silent=true }

vim.api.nvim_set_keymap('n', '<A-,>', ':BufferPrevious<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-.>', ':BufferNext<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-c>', ':BufferClose<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-1>', ':BufferGoto 1<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-2>', ':BufferGoto 2<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-3>', ':BufferGoto 3<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-4>', ':BufferGoto 4<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-5>', ':BufferGoto 5<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-6>', ':BufferGoto 6<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-7>', ':BufferGoto 7<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-8>', ':BufferGoto 8<CR>', opts)
vim.api.nvim_set_keymap('n', '<A-9>', ':BufferGoto 9<CR>', opts)

vim.g.bufferline = {
  icon_close_tab = '',
  icon_close_tab_modified = '',
  icon_separator_active = '',
  icon_separator_inactive = '',
}
