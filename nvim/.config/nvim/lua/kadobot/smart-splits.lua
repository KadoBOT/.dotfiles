local s = require("smart-splits")

s.setup{}

vim.keymap.set("n", "<C-Left>", s.resize_left)
vim.keymap.set("n", "<C-Down>", s.resize_down)
vim.keymap.set("n", "<C-Up>", s.resize_up)
vim.keymap.set("n", "<C-Right>", s.resize_right)
