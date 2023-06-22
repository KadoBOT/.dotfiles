local saga = require("lspsaga")

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
