local null_ls = require("null-ls")
local builtins = null_ls.builtins
local diagnostics = builtins.diagnostics
local formatting = builtins.formatting
local code_actions = builtins.code_actions
local completion = builtins.completion

null_ls.setup({
	sources = {
		diagnostics.tsc,
		diagnostics.golangci_lint,
		diagnostics.jsonlint,
		diagnostics.yamllint,
		diagnostics.staticcheck,
		diagnostics.revive,
		diagnostics.buf,
		formatting.stylua.with({ filetypes = { "lua" } }),
		formatting.buf,
		formatting.biome,
		formatting.gofumpt,
		formatting.goimports,
		formatting.rustywind,
		formatting.yamlfmt,
		formatting.sql_formatter,
		code_actions.gitsigns,
		code_actions.eslint_d,
		completion.tags,
	},
})
