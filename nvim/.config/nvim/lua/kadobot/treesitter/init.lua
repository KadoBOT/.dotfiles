require("nvim-treesitter.configs").setup({
	ensure_installed = { "typescript", "lua", "go", "prisma" },
	sync_install = false,
	highlight = {
		enable = true,
	},
	autopairs = {
		enable = true
	},
	rainbow = {
		enable = true,
		colors = {
			"#FF5D62",
			"#7E9CD8",
			"#957FB8",
			"#FF9E3B",
		}
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
