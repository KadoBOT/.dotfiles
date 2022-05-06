require("telescope").setup({
	defaults = {
        dynamic_preview_title = true,
		layout_strategy = "flex",
		scroll_strategy = "cycle",
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
        path_display={"smart"},
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
		},
		buffers = {
            theme = '',
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

-- Highlights
vim.highlight.create("TelescopeMatching", { guifg = "#F18F91" }, false)
vim.highlight.create("TelescopeSelection", { guibg = "#2F2A4F", gui = "bold" }, false)
vim.highlight.create("TelescopeNormal", { guifg = "#C5C0E0" }, false)
