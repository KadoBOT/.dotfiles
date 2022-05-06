local npairs = require("nvim-autopairs")

npairs.setup({
	check_ts = true,
	ts_config = {
		lua = { "string", "source" },
		javascript = { "template_string" },
		typescript = { "template_string" },
	},
	disable_filetype = { "TelescopePrompt", "spectre_panel", "guihua" },
	fast_wrap = {
		map = "<M-e>",
		chars = { "{", "[", "(", '"', "'", "`" },
		pattern = string.gsub([[ [%'%"%`%)%>%]%)%}%,] ]], "%s+", ""),
		offset = 0, -- Offset from pattern match
		end_key = "$",
		keys = "wdbvqfupxkcmlhjzasrtgyneoi",
		check_comma = true,
		highlight = "PmenuSel",
		highlight_grey = "LineNr",
	},
})
