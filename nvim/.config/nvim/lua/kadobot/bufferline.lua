require("bufferline").setup({
	options = {
		mode = "buffers",
		close_command = "BD! %d",
		right_mouse_command = "BD! %d",
		left_mouse_command = "buffer %d",
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, _level, _diagnostics_dict, _context)
			return "(" .. count .. ")"
		end,
		diagnostics_update_in_insert = false,
		modified_icon = "",
		close_icon = "",
		indicator = { icon = "" },
		right_trunc_marker = "",
		left_trunc_marker = "",
		offsets = {
			{
				filetype = "neo-tree",
				text = function()
					return vim.fn.getcwd()
				end,
				highlight = "Directory",
				text_align = "right",
				padding = 1,
			},
		},
		get_element_icon = function(element)
			local icon, hl = require("nvim-web-devicons").get_icon_by_filetype(element.filetype, { default = false })
			return icon, hl
		end,
		show_buffer_icons = true,
		show_buffer_close_icons = false,
		show_close_icon = false,
		show_tab_indicators = true,
		persist_buffer_sort = true,
		separator_style = { "", "" },
		enforce_regular_tabs = false,
		always_show_bufferline = true,
		sort_by = "insert_at_end",
		max_name_length = 14,
		max_prefix_length = 13,
		tab_size = 20,
		groups = {
			options = {
				toggle_hidden_on_enter = true,
			},
			items = {
				{
					name = "Tests",
					priority = 2,
					matcher = function(buf)
						return buf.name:match("%spec") or buf.name:match("%test")
					end,
				},
				{
					name = "Docs",
					matcher = function(buf)
						return buf.name:match("%.md") or buf.name:match("%.txt")
					end,
				},
			},
		},
	},
	highlights = {
		indicator_selected = {
			bold = true,
			fg = "#7E9CD8",
		},
	},
})
