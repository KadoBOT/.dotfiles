local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
	"                                                     ",
	"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
	"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
	"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
	"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
	"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
	"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
	"                                                     ",
}
--
-- Set menu
dashboard.section.buttons.val = {
	dashboard.button("s", "  > Restore Session", ":lua require('persistence').load()<cr>"),
	dashboard.button("f", "  > Find file", ":Telescope find_files<cr>"),
	dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
	dashboard.button("s", "  > File Browser", ":Telescope file_browser<cr>"),
	dashboard.button("q", "  > Live Grep", ":Telescope live_grep<cr>"),
}

alpha.setup(dashboard.config)

vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
