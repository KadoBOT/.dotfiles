require("toggleterm").setup({
	open_mapping = [[<c-a>]],
})

local set_terminal_keymaps = function()
	local opts = { noremap = true }
	-- vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-a><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "hj", [[<C-a><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-a><C-n><C-W>l]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-a><C-n><C-W>h]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-a><C-n><C-W>j]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-z>", [[<C-a><C-n><C-W>z]], opts)
end

vim.api.nvim_create_autocmd("TermOpen", { pattern = { "term://*" }, callback = set_terminal_keymaps })
