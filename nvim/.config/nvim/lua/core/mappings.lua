local wk = require("which-key")

wk.setup({
	triggers = { "<leader>", "g" },
})

wk.register({
	["<C-^>"] = "which_key_ignore",
	["<leader>"] = { "<c-^>", "which_key_ignore" },
	t = {
		name = "+Tree",
		u = { ":UndotreeShow<CR>", "Undo" },
	},
	g = {
		name = "+Git",
	},
	h = {
		name = "History",
		c = "Command",
		s = "Search",
	},
	z = { ":BD<CR>", "Delete Buffer" },
}, { prefix = "<leader>" })

wk.register({
	["gc"] = "Comment",
	["<leader>+"] = { ":exe 'resize ' . (winheight(0) * 3/2)<CR>", "which_key_ignore" },
	["<leader>-"] = { ":exe 'resize ' . (winheight(0) * 2/3)<CR>", "which_key_ignore" },
	["<leader>."] = { ":exe 'resize ' . (winwidth(0) * 3/2)<CR>", "which_key_ignore" },
	["<leader>,"] = { ":exe 'resize ' . (winwidth(0) * 2/3)<CR>", "which_key_ignore" },
})
wk.register({
	name = "Window",
	["H"] = { "<C-w>v", "Vertical Split" },
	["h"] = { "<C-w>s", "Horizontal Split" },
	["c"] = { "<C-w>q", "Close" },
	["+"] = { ":exe 'resize ' . (winheight(0) * 3/2)<CR>", "Increase Height" },
	["-"] = { ":exe 'resize ' . (winheight(0) * 2/3)<CR>", "Decrease Height" },
}, { prefix = "<leader>w" })

wk.register({
	["<leader>y"] = { "*y", "which_key_ignore" },
	["<leader>Y"] = { "+y", "which_key_ignore" },
}, { mode = "v" })

wk.register({
	["<leader>p"] = { "*p", "which_key_ignore" },
	["<leader>P"] = { "+p", "which_key_ignore" },
})

wk.register({
	["'"] = { "<esc>`>a'<esc>`<i'<esc>", "Wrap selection with ''" },
	['"'] = { '<esc>`>a"<esc>`<i"<esc>', 'Wrap selection with ""' },
	["("] = { "<esc>`>a)<esc>`<i(<esc>", "Wrap selection with ()" },
	["["] = { "<esc>`>a]<esc>`<i[<esc>", "Wrap selection with []" },
	["{"] = { "<esc>`>a}<esc>`<i{<esc>", "Wrap selection with {}" },
}, { prefix = "<leader>", mode = "v" })
