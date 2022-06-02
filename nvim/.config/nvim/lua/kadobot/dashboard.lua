local custom_header = {
	"",
	"",
	"",
	"MMMMMMMMMMMMMMMMMMMMM.                             MMMMMMMMMMMMMMMMMMMMM",
	"`MMMMMMMMMMMMMMMMMMMM           M\\  /M           MMMMMMMMMMMMMMMMMMMM'",
	"  `MMMMMMMMMMMMMMMMMMM          MMMMMM          MMMMMMMMMMMMMMMMMMM'",
	"    MMMMMMMMMMMMMMMMMMM-_______MMMMMMMM_______-MMMMMMMMMMMMMMMMMMM",
	"     MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM",
	"     MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM",
	"     MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM",
	"    .MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM.",
	"   MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM",
	"                  `MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM'",
	"                         `MMMMMMMMMMMMMMMMMM'",
	"                             `MMMMMMMMMM'",
	"                                MMMMMM",
	"                                 MMMM",
	"                                  MM",
}

vim.g.dashboard_default_executive = "telescope"

vim.g.dashboard_custom_section = {
	a = {
		description = { "  Restore Dir Session               " },
		command = "lua require('persisted').load()",
	},
	b = {
		description = { "  Find File                  SPC f f" },
		command = "Telescope find_files",
	},
	c = {
		description = { "  Find Project               SPC f p" },
		command = "Telescope project",
	},
	d = {
		description = { "  Recents                    SPC f r" },
		command = "Telescope oldfiles",
	},
	e = {
		description = { "  File Browser               SPC f t" },
		command = "Telescope file_browser",
	},
	f = {
		description = { "  Find Word                  SPC f g" },
		command = "Telescope live_grep",
	}
}

vim.g.dashboard_custom_footer = { '"It\'s not who I am underneath, but what I do that defines me."' }
vim.g.dashboard_custom_header = custom_header
