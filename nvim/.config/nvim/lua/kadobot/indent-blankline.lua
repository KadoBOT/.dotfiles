require("indent_blankline").setup({
	filetype_exclude = {
		"lspinfo",
		"packer",
		"checkhealth",
		"help",
		"dashboard",
		"telescope",
		"neo-tree",
	},
	show_current_context = true,
	show_current_context_start = true,
	use_treesitter = true,
})
