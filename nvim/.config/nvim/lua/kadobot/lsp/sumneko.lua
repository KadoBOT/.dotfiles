local sumneko_root_path = "/Users/ricardoambrogi/Projects/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/macOS/lua-language-server"

local l = require("lua-dev")
return function(on_attach)
	return l.setup({
		lspconfig = {
			on_attach = on_attach,
			cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" }
		}
	})
end
