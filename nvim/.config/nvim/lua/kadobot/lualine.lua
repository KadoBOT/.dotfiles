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

local function progress_message()
	local Lsp = vim.lsp.util.get_progress_messages()[1]

	if Lsp then
		local msg = Lsp.message or ""
		local percentage = Lsp.percentage or 0
		local title = Lsp.title or ""
		local spinners = { "", "", "" }
		local success_icon = { "", "", "" }

		local ms = vim.loop.hrtime() / 1000000
		local frame = math.floor(ms / 120) % #spinners

		if percentage >= 70 then
			return string.format(" %%<%s %s %s (%s%%%%) ", success_icon[frame + 1], title, msg, percentage)
		end

		return string.format(" %%<%s %s %s (%s%%%%) ", spinners[frame + 1], title, msg, percentage)
	end

	return ""
end

local function fugitive_branch()
	local icon = "" -- e0a0
	return icon .. " " .. vim.fn.FugitiveHead()
end

local function gps_status()
    local gps = require('nvim-gps')
    if gps.is_available() then
        return gps.get_location()
    end
end


require("lualine").setup({
	options = {
		theme = "kanagawa",
		disabled_filetypes = { "TelescopePrompt" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			fugitive_branch,
			"diff",
		},
		lualine_c = {
			{ progress_message },
			{ "filename", path = 1 },
		},
		lualine_x = {
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
			},
		},
		lualine_y = { gps_status, "location", "filetype" },
		lualine_z = {
			{ lsp },
		},
	},
	inactive_sections = {
		lualine_c = { "filename" },
	},
	extensions = {
		"fugitive",
		"quickfix",
		"nvim-tree",
	},
})
