require('leap')

vim.api.nvim_set_keymap("n", "s", "<Plug>(leap-forward)", { silent = true })
vim.api.nvim_set_keymap("n", "S", "<Plug>(leap-backward)", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>s", "<Plug>(leap-cross-window)", { silent = true })
