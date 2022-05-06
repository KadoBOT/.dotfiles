local null_ls = require("null-ls")
local builtins = null_ls.builtins
local diagnostics = builtins.diagnostics
local completion = builtins.completion
local formatting = builtins.formatting
local code_actions = builtins.code_actions

null_ls.setup({
	sources = {
		diagnostics.eslint_d,
		diagnostics.tsc,
		formatting.eslint_d.with({ filetypes = { "typescript", "javascript", "typescriptreact" } }),
		formatting.stylua.with({ filetypes = { "lua" } }),
		formatting.gofmt,
		code_actions.gitsigns,
		code_actions.eslint_d,
	},
})
