vim.opt.termguicolors = true

local colors = require("kanagawa.colors").setup({})

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
		indicator_icon = "",
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
			},
		},
        show_buffer_icons = true,
        show_buffer_close_icons = false,
        show_buffer_default_icon = true,
        show_close_icon = false,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        separator_style = { "", "" },
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        sort_by = "insert_at_end",
	},
    highlights = {
        indicator_selected = {
            gui = "bold",
            guifg = "#7E9CD8",
        }
    },
	groups = {
		options = {
			toggle_hidden_on_enter = true,
		},
		items = {
			{
				name = "Tests",
				priority = 2,
				matcher = function(buf)
					return buf.name.match("%spec") or buf.name:match("%test")
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
})

local wk = require("which-key")

wk.register({
	name = "Buffer",
	["p"] = { ":BufferLineCyclePrev<CR>", "Previous Buffer" },
	["n"] = { ":BufferLineCycleNext<CR>", "Next Buffer" },
	["c"] = { ":BufferLineClosePick<CR>", "Close Buffer" },
	["d"] = { ":BufferLineCloseRight<CR>", "Close Right" },
	["1"] = { ":BufferLineGoToBuffer 1<CR>", "Buffer 1" },
	["2"] = { ":BufferLineGoToBuffer 2<CR>", "Buffer 2" },
	["3"] = { ":BufferLineGoToBuffer 3<CR>", "Buffer 3" },
	["4"] = { ":BufferLineGoToBuffer 4<CR>", "Buffer 4" },
	["5"] = { ":BufferLineGoToBuffer 5<CR>", "Buffer 5" },
	["6"] = { ":BufferLineGoToBuffer 6<CR>", "Buffer 6" },
	["7"] = { ":BufferLineGoToBuffer 7<CR>", "Buffer 7" },
	["8"] = { ":BufferLineGoToBuffer 8<CR>", "Buffer 8" },
	["9"] = { ":BufferLineGoToBuffer 9<CR>", "Buffer 9" },
}, { prefix = "<leader>b" })

wk.register({
	["<C-p>"] = { ":BufferLineCyclePrev<CR>", "Previous Buffer" },
	["<C-n>"] = { ":BufferLineCycleNext<CR>", "Next Buffer" },
})
