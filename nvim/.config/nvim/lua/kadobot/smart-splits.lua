local s = require("smart-splits")

s.setup({
	ignored_buftypes = { "neo-tree" },
})

vim.keymap.set("n", "<C-H>", require("smart-splits").move_cursor_left, { silent = true })
vim.keymap.set("n", "<C-J>", require("smart-splits").move_cursor_down, { silent = true })
vim.keymap.set("n", "<C-K>", require("smart-splits").move_cursor_up, { silent = true })
vim.keymap.set("n", "<C-L>", require("smart-splits").move_cursor_right, { silent = true })
