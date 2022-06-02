local wk = require("which-key")
local g = vim.g

g.nvim_tree_indent_markers = 1 -- 0 by default, this option shows indent markers when folders are open
g.nvim_tree_git_hl = 1 -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
g.nvim_tree_highlight_opened_files = 1 -- 0 by default, will enable folder and file icon highlight for opened files/directories.
g.nvim_tree_root_folder_modifier = ":~" -- This is the default. See :help filename-modifiers for more options
g.nvim_tree_add_trailing = 1 -- 0 by default, append a trailing slash to folder names
g.nvim_tree_group_empty = 1 --  0 by default, compact folders that only contain a single folder into one node in the file tree
g.nvim_tree_icon_padding = " " -- one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
g.nvim_tree_respect_buf_cwd = 1 -- 0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
g.nvim_tree_refresh_wait = 500 -- 1000 by default, control how often the tree can be refreshed, 1000 means the tree can be refresh once per 1000ms.
g.nvim_tree_special_files = {}
g.nvim_tree_show_icons = {
	git = 1,
	folders = 1,
	files = 1,
	folder_arrows = 1,
}

g.nvim_tree_icons = {
	default = "",
	symlink = "",
	git = {
		unstaged = "",
		staged = "",
		unmerged = "",
		renamed = "",
		untracked = "",
		deleted = "",
		ignored = "",
	},
	folder = {
		arrow_open = "",
		arrow_closed = "",
		default = "",
		open = "",
		empty = "",
		empty_open = "",
		symlink = "",
		symlink_open = "",
	},
	lsp = {
		hint = "",
		info = "",
		warning = "",
		error = "",
	},
}

wk.register({
	[";"] = { ":NvimTreeToggle<CR>", "Open" },
})

wk.register({
	name = "Tree",
	["t"] = { ":NvimTreeToggle<CR>", "Open" },
	["f"] = { ":NvimTreeFindFile<CR>", "Find File" },
	["r"] = { ":NvimTreeRefresh<CR>", "Refresh" },
}, { prefix = "<leader>t" })

--
require("nvim-tree").setup({
	actions = {
		open_file = {
			quit_on_open = true,
			window_picker = {
				enable = true,
				exclude = {
					filetype = { "notify", "packer", "qf", "Trouble" },
					buftype = { "terminal", "nofile", "help" },
				},
			},
		},
		change_dir = {
			global = true,
		},
	},
	auto_close = true,
	diagnostics = {
		enable = true,
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	update_to_buf_dir = {
		enable = true,
		auto_open = true,
	},
	update_cwd = true,
	view = {
		side = "right",
		auto_resize = true,
		width = 50,
		hide_root_folder = false,
	},
	git_hl = 1,
	root_folder_modifier = ":t",
	show_icons = {
		git = 1,
		folders = 1,
		files = 1,
		folder_arrows = 1,
		tree_width = 50,
	},
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = false,
	ignore_ft_on_setup = {
		"dashboard",
	},
	hijack_cursor = false,
	system_open = {
		cmd = nil,
		args = {},
	},
	filters = {
		dotfiles = false,
		custom = {},
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 500,
	},
})
