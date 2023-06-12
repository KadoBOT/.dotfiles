local saga = require("lspsaga")
local wk = require("which-key")

saga.setup({
	max_preview_lines = 40,
	move_in_saga = { prev = "<C-p>", next = "<C-n>" },
	finder_action_keys = {
		quit = { "<Esc>", "q" },
		open = "<CR>",
		scroll_down = "[",
		scroll_up = "]",
	},
})

wk.register({
	K = "<cmd>Lspsaga hover_doc<CR>",
})

wk.register({
	h = { "<cmd>Lspsaga lsp_finder<CR>", "LSP Finder" },
	-- n = { "<cmd>Lspsaga show_line_diagnostics<CR>", "Show Line Diagnostics" },
	z = { "<cmd>Lspsaga show_cursor_diagnostics<CR>", "Show Cursor Diagnostics" },
	p = { "<cmd>Lspsaga peek_definition<CR>", "Preview Definition" },
	r = { "<cmd>Lspsaga rename<CR>", "Rename" },
	a = { "<cmd>Lspsaga code_action<CR>", "Code Action" },
	o = { "<cmd>LSoutlineToggle<CR>", "whichkey" },
	n = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "Next Diagnostic" },
	N = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Prev Diagnostic" },
}, { prefix = "g" })

wk.register({
	a = { "<cmd>Lspsaga code_action<CR>", "Code Action" },
}, { prefix = "g", mode = "v" })
