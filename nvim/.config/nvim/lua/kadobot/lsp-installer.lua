-- local nvim_lsp = require("lspconfig")
-- local lsp_installer = require("nvim-lsp-installer")
local server = require("nvim-lsp-installer.server")
local path = require("nvim-lsp-installer.path")
local a = require("nvim-lsp-installer.core.async")
local servers = require("nvim-lsp-installer.servers")
local git = require("nvim-lsp-installer.core.managers.git")

local server_name = "vls"

local root_dir = server.get_server_root_path(server_name)
-- local vls_binary = root_dir .. "/bin/vls"

-- lsp_installer.on_server_ready(function(_server)
-- 	local opts = {}
--
-- 	if _server.name == "vls" then
-- 		opts.filetypes = { "vlang" }
--         opts.root_dir = nvim_lsp.util.root_pattern(root_dir)
--         opts.cmd = { vls_binary }
-- 	end
--
-- 	_server:setup(opts)
-- end)

local function installer(ctx)
	git.clone({ "https://github.com/vlang/vls" }).with_receipt()

	if vim.in_fast_event() then
		a.scheduler()
	end

	if vim.fn.executable("clang") == 1 then
		ctx.spawn.v({ "run", "build.vsh", "clang" })
	elseif vim.fn.executable("gcc") == 1 then
		ctx.spawn.v({ "run", "build.vsh", "gcc" })
	elseif vim.fn.executable("cc") == 1 then
		ctx.spawn.v({ "run", "build.vsh", "cc" })
	elseif vim.fn.executable("msvc") == 1 then
		ctx.spawn.v({ "run", "build.vsh", "cc" })
	else
		ctx.stdio_sink.stderr("Failed to find a compiler")
	end
end

local vls_server = server.Server:new({
	async = true,
	name = server_name,
	root_dir = root_dir,
	homepage = "https://github.com/vlang/vls",
	languages = { "vlang" },
	installer = installer,
	default_options = {
		cmd = { path.concat({ root_dir, "vls", "bin", "vls" }) },
	},
})

servers.register(vls_server)
