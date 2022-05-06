require("kadobot.lspkind")

local nvim_lsp = require("lspconfig")
local cmp_lsp = require("cmp_nvim_lsp")
local wk = require("which-key")

local sumneko_root_path = "/Users/ricardoambrogi/Projects/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/macOS/lua-language-server"

local base_path = "/Users/ricardoambrogi/.local/share/nvim/lsp_servers"
local vls_root_path = base_path .. "/vls"
local vls_binary = vls_root_path .. "/bin/vls"

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		"documentation",
		"detail",
		"additionalTextEdits",
	},
}
capabilities.textDocument.codeAction = {
	dynamicRegistration = true,
	codeActionLiteralSupport = {
		codeActionKind = {
			valueSet = (function()
				local res = vim.tbl_values(vim.lsp.protocol.CodeActionKind)
				table.sort(res)
				return res
			end)(),
		},
	},
}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- omnifunc
	if client.resolved_capabilities.completion then
		vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	end

	if client.name == "tsserver" then
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_formatting_range = false

		vim.api.nvim_create_autocmd("BufWritePre", { buffer = bufnr, command = ":EslintFixAll" })
	end

	if client.resolved_capabilities.call_hierarchy then
		vim.cmd([[command! -buffer LspIncomingCalls lua vim.lsp.buf.incoming_calls()]])
		vim.cmd([[command! -buffer LspOutgoingCalls lua vim.lsp.buf.outgoing_calls()]])
	end

	if client.resolved_capabilities.document_highlight then
		local augroup = "lsp_document_highlight"
		vim.api.nvim_create_augroup(augroup, {})

		local cmds = {
			{ callback = vim.lsp.buf.document_highlight, events = { "CursorHoldI", "CursorHold" } },
			{ callback = vim.lsp.buf.clear_references, events = { "CursorMoved", "CursorMovedI" } },
		}

		for _, cmd in pairs(cmds) do
			vim.api.nvim_create_autocmd(cmd.events, {
				buffer = bufnr,
				callback = cmd.callback,
				group = augroup,
			})
		end
	end

	if client.resolved_capabilities.document_formatting then
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			callback = vim.lsp.buf.formatting_sync,
		})
	end

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
		vim.lsp.handlers.signature_help,
		{ border = "rounded" }
	)

	-- Diagnostics
	local config = {
		virtual_text = false,
		signs = true,
		update_in_insert = false,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)
end

-- See `:help vim.lsp.*` for documentation on any of the below functions
wk.register({
	["K"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover Doc" },
	["<leader>e"] = { "<cmd>lua vim.diagnostic.setqflist()<CR>", "Add to Quickfix" },
	["<leader>q"] = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "Add to Loclist" },
})

wk.register({
	["D"] = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Go to declaration" },
	["d"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition" },
	["i"] = { ":Telescope lsp_implementations<CR>", "Go to implementation" },
	["r"] = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
	["R"] = { ":Telescope lsp_references<CR>", "References" },
	["s"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
	["y"] = { ":Telescope lsp_document_symbols<CR>", "Document symbols" },
	["Y"] = { ":Telescope lsp_dynamic_workspace_symbols<CR>", "Workspace Symbols" },
	["t"] = { ":Telescope lsp_type_definitions<CR>", "Type Definition" },
	["x"] = { ":Telescope lsp_code_actions<CR>", "Code Actions" },
	["z"] = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Line Diagnostics" },
	["o"] = { ":Telescope lsp_diagnostics<CR>", "Document Diagnostics" },
	["e"] = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Float diagnostic" },
	["n"] = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Go to prev diagnostic" },
	["p"] = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Go to prev diagnostic" },
	["f"] = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format Buffer" },
}, { prefix = "g" })

wk.register({
	["x"] = { ":Telescope lsp_range_code_actions<CR>", "Code Actions" },
	["f"] = { "<cmd>lua vim.lsp.buf.range_formatting()<CR>", "Format Buffer" },
}, { prefix = "g", mode = "v" })

wk.register({
	name = "Workspace",
	["a"] = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", "Add folder" },
	["r"] = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "Remove Workspace Folder" },
	["l"] = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", "List Workspace Folders" },
}, { prefix = "<leader>=" })

wk.register({
	name = "Code",
	["r"] = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
	["a"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
	["f"] = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format Buffer" },
}, { prefix = "<leader>c" })

vim.api.nvim_set_keymap("i", "<c-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { silent = true })
-- Use a loop to conveniently call 'setup' on multiple servers and
local servers = { "tsserver", "vimls", "gopls", "yamlls", "dartls", "eslint", "html", "cssls", "jsonls" }
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup({
		on_attach = on_attach,
		flags = {
			debounce_text_changes = 150,
		},
		capabilities = cmp_lsp.update_capabilities(capabilities),
	})
end

nvim_lsp.ccls.setup({
	on_attach = on_attach,
	cmd = { base_path .. "/ccls/bin/ccls" },
})

nvim_lsp.vls.setup({
	on_attach = on_attach,
	cmd = { vls_binary },
	filetypes = { "vlang" },
	root_dir = nvim_lsp.util.root_pattern("v.mod", ".git"),
})

nvim_lsp.sumneko_lua.setup({
	on_attach = on_attach,
	capabilities = cmp_lsp.update_capabilities(capabilities),
	cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
	settings = {
		Lua = {
			format = {
				enable = true,
			},
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = vim.split(package.path, ";"),
			},
			diagnostics = {
				enable = true,
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
				maxPreload = 3000,
				preloadFileSize = 1024,
			},
		},
	},
})

local signs = {
	Error = " ",
	Warning = " ",
	Hint = "ﯦ ",
	Information = " ",
}

for type, icon in pairs(signs) do
	local hl = "LspDiagnosticsSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
