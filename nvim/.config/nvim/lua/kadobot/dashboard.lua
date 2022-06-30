local db = require('dashboard')

db.custom_header = {
	"",
	"",
	"",
	"MMMMMMMMMMMMMMMMMMMMM.                             MMMMMMMMMMMMMMMMMMMMM",
	"`MMMMMMMMMMMMMMMMMMMM           M\\  /M           MMMMMMMMMMMMMMMMMMMM' ",
	"  `MMMMMMMMMMMMMMMMMMM          MMMMMM          MMMMMMMMMMMMMMMMMMM'    ",
	"    MMMMMMMMMMMMMMMMMMM-_______MMMMMMMM_______-MMMMMMMMMMMMMMMMMMM      ",
	"     MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM       ",
	"     MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM       ",
	"     MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM       ",
	"    .MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM.      ",
	"   MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM     ",
	"                  `MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM'                    ",
	"                         `MMMMMMMMMMMMMMMMMM'                           ",
	"                             `MMMMMMMMMM'                               ",
	"                                MMMMMM                                  ",
	"                                 MMMM                                   ",
	"                                  MM                                    ",
	"                                                                        ",
	"                                                                        "
}

db.custom_center = {
	{
		icon = "",
		desc = "  Restore Dir Session               ",
		action = "lua require('persisted').load()",
	},
	{
		icon = "",
		desc = "  Find File                  ",
		action = "Telescope find_files",
		shortcut = "SPC f f"
	},
	{
		icon = "",
		desc = "  Find Project               ",
		action = "Telescope project",
		shortcut = "SPC f p"
	},
	{
		icon = "",
		desc = "  Recents                    ",
		action = "Telescope oldfiles",
		shortcut = "SPC f r"
	},
	{
		icon = "",
		desc = "  File Browser               ",
		action = "Telescope file_browser",
		shortcut = "SPC f t"
	},
	{
		icon = "",
		desc = "  Live Grep                  ",
		action = "Telescope live_grep",
		shortcut = "SPC f g"
	}
}

db.custom_footer = { '"It\'s not who I am underneath, but what I do that defines me."' }
