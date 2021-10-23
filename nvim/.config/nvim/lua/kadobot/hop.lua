require('hop').setup{
  keys = 'qzxvjkpwyghclmudfbiaosernt',
}

vim.api.nvim_set_keymap('n', '$', "<cmd>lua require'hop'.hint_words()<cr>", {})
