local map = vim.keymap.set

-- remap navigation
-- map({ "n", "v" }, "l", "<Left>", { noremap = true })
-- map({ "n", "v" }, "h", "<Down>", { noremap = true })
-- map({ "n", "v" }, "j", "<Up>", { noremap = true })
-- map({ "n", "v" }, "z", "<Right>", { noremap = true })
-- map({ "n", "v" }, "k", "z", { noremap = true })

-- yank
map({ "v" }, "<leader>y", "*y", { noremap = true })
map({ "v" }, "<leader>Y", "+y", { noremap = true })
map({ "n" }, "<leader>p", "*p", { noremap = true })
map({ "n" }, "<leader>P", "+p", { noremap = true })

-- wrapper
map({ "v" }, '<leader>"', '<esc>`>a"<esc>`<i"<esc>', { noremap = true, silent = true })
map({ "v" }, "<leader>(", "<esc>`>a)<esc>`<i(<esc>", { noremap = true, silent = true })
map({ "v" }, "<leader>[", "<esc>`>a]<esc>`<i[<esc>", { noremap = true, silent = true })
map({ "v" }, "<leader>{", "<esc>`>a}<esc>`<i{<esc>", { noremap = true, silent = true })
map({ "v" }, "<leader>$", "<esc>`>a}<esc>`<i${<esc>", { noremap = true, silent = true })

-- buffers
map("", "<leader><Space>", ":b#<cr>", { noremap = true, desc = "Previous Buffer" })
