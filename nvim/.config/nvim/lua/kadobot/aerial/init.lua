local aerial = require("aerial")
require("kadobot.aerial.winbar")
local actions = require("aerial.actions")

-- Toggle the aerial window with <leader>a
vim.keymap.set("n", "!", "<cmd>AerialToggle!<CR>", { silent = true })

aerial.setup({
	backends = { "lsp", "treesitter", "markdown" },
	show_guides = true,
	guides = {
		mid_item = "├ ",
		last_item = "└ ",
		nested_top = "│ ",
		whitespace = "  ",
	},
	keymaps = {
		["{"] = actions.prev,
		["}"] = actions.next,
		["[["] = actions.prev_up,
		["]]"] = actions.next_up,
	},
	layout = {
		attach_mode = "global",
		min_width = { 35, 0.2 },
		default_direction = "prefer_right",
		placement = "window",
	},
	close_automatic_events = { "unfocus" },
	close_on_select = true,
})
