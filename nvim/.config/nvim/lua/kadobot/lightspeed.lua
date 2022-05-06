require'lightspeed'.setup {
}

vim.api.nvim_set_keymap("n", "s", "<Plug>Lightspeed_s", { silent = true })
vim.api.nvim_set_keymap("n", "S", "<Plug>Lightspeed_S", { silent = true })
vim.api.nvim_set_keymap("n", "f", "<Plug>Lightspeed_f", { silent = true })
vim.api.nvim_set_keymap("n", "F", "<Plug>Lightspeed_F", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>s", "<Plug>Lightspeed_gs", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>S", "<Plug>Lightspeed_gS", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>a", "<Plug>Lightspeed_;_sx", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>A", "<Plug>Lightspeed_;_ft", { silent = true })
