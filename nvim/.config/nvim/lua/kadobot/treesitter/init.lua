require("nvim-treesitter.configs").setup({
	ensure_installed = { "typescript", "lua", "go", "prisma" },
	sync_install = false,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
		use_languagetree = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<TAB>",
			scope_incremental = "<CR>",
			node_incremental = "<TAB>",
			node_decremental = "<S-TAB>",
		},
	}
})
