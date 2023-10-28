for _, source in ipairs({
	"core.settings",
	"core.keymaps",
	"core.plugins",
}) do
	local status_ok, fault = pcall(require, source)
	if not status_ok then
		vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault)
	end
end

if base.default_colorscheme then
	if not pcall(vim.cmd.colorscheme, base.default_colorscheme) then
		vim.schedule(function()
			vim.notify("Error setting up colorscheme: " .. base.default_colorscheme, vim.log.levels.ERROR)
		end)
	end
end
