require("nvim-treesitter.configs").setup({
	ensure_installed = { "go", "typescript", "tsx" },
	sync_install = true,
	highlight = {
		enable = true,
	},
	autopairs = {
		enable = true,
	},
	rainbow = {
		enable = true,
		colors = {
			"#FF5D62",
			"#7E9CD8",
			"#957FB8",
			"#FF9E3B",
		},
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<TAB>",
			scope_incremental = "<CR>",
			node_incremental = "<TAB>",
			node_decremental = "<S-TAB>",
		},
	},
	-- experimental
	indent = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
	},
	additional_vim_regex_highlighting = true,
})

require("kadobot.treesitter.parsers")
