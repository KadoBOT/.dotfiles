-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map({ "n", "v" }, "l", "<Left>", { noremap = true })
map({ "n", "v" }, "h", "<Down>", { noremap = true })
map({ "n", "v" }, "j", "<Up>", { noremap = true })
map({ "n", "v" }, "z", "<Right>", { noremap = true })
map({ "n", "v" }, "k", "z", { noremap = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-l>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-h>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-j>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-z>", "<C-w>l", { desc = "Go to right window", remap = true })
