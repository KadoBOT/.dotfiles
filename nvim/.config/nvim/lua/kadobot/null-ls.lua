local null_ls = require("null-ls")
local builtins = null_ls.builtins
local diagnostics = builtins.diagnostics
local formatting = builtins.formatting
local code_actions = builtins.code_actions

null_ls.setup({
	sources = {
		diagnostics.eslint,
		diagnostics.tsc,
		formatting.eslint_d.with({ filetypes = { "typescript", "javascript" } }),
		formatting.stylua.with({ filetypes = { "lua" } }),
		formatting.prettierd.with({ filetypes = { "html", "json", "yaml", "markdown" } }),
		formatting.gofmt,
		code_actions.gitsigns,
		code_actions.eslint_d,
	},
})
