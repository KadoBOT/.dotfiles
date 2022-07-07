local status_ok, aerial = pcall(require, "aerial")
local icon_ok, icons = pcall(require, "nvim-web-devicons")

if not status_ok or not icon_ok then
	return
end

local M = {}

local function format_symbols(symbols, depth, separator, icons_enabled)
	local parts = {}
	depth = depth or #symbols

	if depth > 0 then
		symbols = { table.unpack(symbols, 1, depth) }
	else
		symbols = { table.unpack(symbols, #symbols + 1 + depth) }
	end

	for _, symbol in ipairs(symbols) do
		if icons_enabled then
			table.insert(parts, string.format("%s %s", symbol.icon, symbol.name))
		else
			table.insert(parts, symbol.name)
		end
	end

	return table.concat(parts, separator)
end

M.winbar = function()
	local filename = vim.fn.expand("%:t")
	local ext = vim.fn.expand("%:e")
	local icon = icons.get_icon(filename, ext)

	local symbols = aerial.get_location(true)
	local symbol_path = format_symbols(symbols, nil, "  ", true)

	if icon then
		return icon .. "   " .. (symbol_path == "" and "..." or symbol_path)
	else
		return ""
	end
end

vim.o.winbar = "%{%v:lua.require('kadobot.aerial.winbar').winbar()%}"

return M
