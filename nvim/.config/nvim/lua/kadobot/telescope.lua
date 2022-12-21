require("telescope").setup({
	defaults = {
		dynamic_preview_title = true,
		layout_strategy = "vertical",
		scroll_strategy = "cycle",
		layout_config = {
			vertical = {
				prompt_position = "bottom",
				preview_cutoff = 0,
				height = 0.95,
				width = 0.92,
			},
		},
		file_sorter = require("telescope.sorters").get_fuzzy_file,
		color_devicons = true,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		use_less = true,
		winblend = 0,
		file_ignore_patterns = { "%.git", "node_modules/", "dist/", "reports/" },
		prompt_prefix = "   ",
		selection_caret = " ",
		path_display = { "smart" },
		mappings = {
			n = {
				["j"] = require("telescope.actions").move_selection_previous,
				["h"] = require("telescope.actions").move_selection_next,
				["<leader>"] = require("telescope.actions").which_key,
			},
		},
		vimgrep_arguments = {
			"rg",
			"--ignore",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--trim",
			"--hidden",
			"-u",
		},
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
		fzf_writer = {
			minimum_grep_characters = 2,
			minimum_files_characters = 2,
			use_highlighter = true,
		},
	},
	pickers = {
		find_files = {
			mappings = {
				n = {
					["cd"] = function(prompt_bufnr)
						local selection = require("telescope.actions.state").get_selected_entry()
						local dir = vim.fn.fnamemodify(selection.path, ":p:h")
						require("telescope.actions").close(prompt_bufnr)
						-- Depending on what you want put `cd`, `lcd`, `tcd`
						vim.cmd(string.format("silent lcd %s", dir))
					end,
				},
			},
			find_command = {
				"rg",
				"--files",
				"--hidden",
				"-g",
				"!.git/",
				"-g",
				"!node_modules",
			},
			theme = "dropdown",
		},
		buffers = {
			theme = "",
			show_all_buffers = true,
			sort_lastused = true,
		},
		oldfiles = {
			only_cwd = true,
		},
	},
})

require("telescope").load_extension("fzf")
require("telescope").load_extension("file_browser")
require("telescope").load_extension("project")
require("telescope").load_extension("aerial")
require("telescope").load_extension("dap")

-- Highlights
vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = "#F18F91" })
vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#2F2A4F", bold = true })
vim.api.nvim_set_hl(0, "TelescopeNormal", { fg = "#C5C0E0" })
