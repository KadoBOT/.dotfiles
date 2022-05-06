function AlwaysShow()
	return true
end

local options = {
	onlyTypes = { "typescript", "typescriptreact" },
	filter = "AlwaysShow",
}
local menuItem = { "somename", ":echo hey", options }
local nestedMenu = { "somenestedname", { menuItem, menuItem }, options }
local divider = { "──────────────────────────", nil, options }

vim.g["conmenu#default_menu"] = { menuItem, divider, menuItem, nestedMenu }
