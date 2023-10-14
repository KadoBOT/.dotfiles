local highlight = {
    "CursorColumn",
    "Whitespace"
}

require("ibl").setup({
	exclude = {
		filetypes = {
			"help",
			"startify",
			"aerial",
			"alpha",
			"dashboard",
			"packer",
			"neogitstatus",
			"NvimTree",
			"neo-tree",
			"Trouble",
		},
	},
	indent = { highlight = highlight, char = "▏" },
	-- whitespace = { highlight = highlight, remove_blankline_trail = false },
	scope = { enabled = true },
})
