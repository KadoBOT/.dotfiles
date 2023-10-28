require("trouble").setup({
	action_keys = {
		previous = "<C-p>",
		next = "<C-n>",
		toggle_fold = { "kA", "ka" },
	},
	use_diagnostic_signs = true,
})

vim.keymap.set("n", "<leader>cT", "<cmd>TroubleToggle<CR>", { desc = "Trouble Toggle" })
vim.keymap.set("n", "<leader>cW", "<cmd>TroubleToggle workspace_diagnostics<CR>", { desc = "Workspace Diagnostics" })
vim.keymap.set("n", "<leader>cD", "<cmd>TroubleToggle document_diagnostics<CR>", { desc = "Document Diagnostics" })
vim.keymap.set("n", "<leader>ce", "<cmd>TroubleToggle quickfix<CR>", { desc = "Quickfix" })
vim.keymap.set("n", "<leader>cq", "<cmd>TroubleToggle loclist<CR>", { desc = "Loclist" })
vim.keymap.set("n", "<leader>cR", "<cmd>TroubleToggle lsp_references<CR>", { desc = "References" })
vim.keymap.set("n", "<leader>cd", "<cmd>TroubleToggle lsp_definitions<cr>", { desc = "Definitions" })
vim.keymap.set("n", "<leader>ct", "<cmd>TroubleToggle lsp_type_definitions<cr>", { desc = "Type Definitions" })
vim.keymap.set("n", "<leader>ci", "<cmd>TroubleToggle lsp_implementations<cr>", { desc = "Implementations" })
