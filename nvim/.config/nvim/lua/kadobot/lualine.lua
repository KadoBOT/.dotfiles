local custom_fname = require("lualine.components.filename"):extend()
local highlight = require("lualine.highlight")

local default_status_colors = { saved = "#228B22", modified = "#C70039" }

function custom_fname:init(options)
	custom_fname.super.init(self, options)
	self.status_colors = {
		saved = highlight.create_component_highlight_group(
			{ bg = default_status_colors.saved },
			"filename_status_saved",
			self.options
		),
		modified = highlight.create_component_highlight_group(
			{ bg = default_status_colors.modified },
			"filename_status_modified",
			self.options
		),
	}
	if self.options.color == nil then
		self.options.color = ""
	end
end

function custom_fname:update_status()
	local data = custom_fname.super.update_status(self)
	data = highlight.component_format_highlight(
		vim.bo.modified and self.status_colors.modified or self.status_colors.saved
	) .. data
	return data
end

local function lsp()
	local icon = [[  ]]
	local msg = "No Active LSP"
	local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
	local clients = vim.lsp.get_active_clients()
	if next(clients) == nil then
		return icon .. msg
	end

	for _, client in ipairs(clients) do
		local filetypes = client.config.filetypes
		if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
			return icon .. client.name
		end
	end

	return icon .. msg
end

local function fugitive_branch()
	local icon = "" -- e0a0
	return icon .. " " .. vim.fn.FugitiveHead()
end


local function diff_source()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return {
			added = gitsigns.added,
			modified = gitsigns.changed,
			removed = gitsigns.removed,
		}
	end
end

require("lualine").setup({
	options = {
		theme = "kanagawa",
		disabled_filetypes = { "TelescopePrompt", "NvimTree", "neo-tree" },
		globalstatus = true,
	},
	sections = {
		lualine_a = {
			{ "filetype", icon_only = true, colored = false },
			"mode",
		},
		lualine_b = {
			fugitive_branch,
			{ "diff", source = diff_source },
			{
				"diagnostics",
				sources = { "nvim_diagnostic", "nvim_lsp" },
				sections = { "error", "warn" },
			},
		},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {
			"location",
			"progress",
		},
		lualine_z = {
			lsp,
		},
	},
	extensions = {
		"fugitive",
		"quickfix"
	},
})
