local map = vim.keymap.set

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- remap navigation
map({ "n", "v" }, "l", "<Left>", { noremap = true })
map({ "n", "v" }, "h", "<Down>", { noremap = true })
map({ "n", "v" }, "j", "<Up>", { noremap = true })
map({ "n", "v" }, "z", "<Right>", { noremap = true })
map({ "n", "v" }, "k", "z", { noremap = true })

map("n", "<C-L>", require("smart-splits").move_cursor_left, { silent = true, noremap = true })
map("n", "<C-H>", require("smart-splits").move_cursor_down, { silent = true, noremap = true })
map("n", "<C-J>", require("smart-splits").move_cursor_up, { silent = true, noremap = true })
map("n", "<C-Z>", require("smart-splits").move_cursor_right, { silent = true, noremap = true })
