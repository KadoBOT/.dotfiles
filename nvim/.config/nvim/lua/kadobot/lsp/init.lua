require("mason").setup()
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
	automatic_installation = true,
})

local M = {}

local nvim_lsp = require("lspconfig")
local configs = require("lspconfig/configs")
local cmp_lsp = require("cmp_nvim_lsp")

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
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			-- apply whatever logic you want (in this example, we'll only use null-ls)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- omnifunc
	if client.server_capabilities.completion then
		vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	end

	if client.name == "gopls" then
		if not client.server_capabilities.semanticTokensProvider then
			local semantic = client.config.capabilities.textDocument.semanticTokens
			client.server_capabilities.semanticTokensProvider = {
				full = true,
				legend = {
					tokenTypes = semantic.tokenTypes,
					tokenModifiers = semantic.tokenModifiers,
				},
				range = true,
			}
		end
	end

	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				lsp_formatting(bufnr)
			end,
		})
	end

	if client.name == "sqls" then
		vim.api.nvim_create_autocmd("User", {
			pattern = "SqlsConnectionChoice",
			callback = function(event)
				vim.notify(event.data.choice)
			end,
		})
	end

	if client.name == "sumneko_lua" then
		client.server_capabilities.document_formatting = false
		client.server_capabilities.document_formatting_range = false

		vim.cmd([[
			augroup FormatOnSave
				autocmd!
				autocmd BufWritePost * silent! :!stylua %
			augroup END
		]])
	end

	if client.server_capabilities.call_hierarchy then
		vim.cmd([[command! -buffer LspIncomingCalls lua vim.lsp.buf.incoming_calls()]])
		vim.cmd([[command! -buffer LspOutgoingCalls lua vim.lsp.buf.outgoing_calls()]])
	end

	if client.server_capabilities.document_highlight then
		local group = "lsp_document_highlight"
		vim.api.nvim_create_augroup(group, {})

		local cmds = {
			{ callback = vim.lsp.buf.document_highlight, events = { "CursorHoldI", "CursorHold" } },
			{ callback = vim.lsp.buf.clear_references, events = { "CursorMoved", "CursorMovedI" } },
		}

		for _, cmd in pairs(cmds) do
			vim.api.nvim_create_autocmd(cmd.events, {
				buffer = bufnr,
				callback = cmd.callback,
				group = group,
			})
		end
	end

	if client.server_capabilities.document_formatting then
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			callback = vim.lsp.buf.format,
		})
	end

	-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
	-- vim.lsp.handlers["textDocument/signatureHelp"] =
	-- 	vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
	vim.lsp.handlers["wgsl-analyzer/requestConfiguration"] = function(err, result, ctx, config)
		return {
			success = true,
			customImports = { _dummy_ = "dummy" },
			shaderDefs = {},
			trace = {
				extension = false,
				server = false,
			},
			inlayHints = {
				enabled = false,
				typeHints = false,
				parameterHints = false,
				structLayoutHints = false,
				typeVerbosity = "inner",
			},
			diagnostics = {
				typeErrors = true,
				nagaParsingErrors = true,
				nagaValidationErrors = true,
				nagaVersion = "main",
			},
		}
	end

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

local servers = mason_lspconfig.get_installed_servers()

if not configs.golangcilsp then
	configs.golangcilsp = {
		default_config = {
			cmd = { "golangci-lint-langserver" },
			root_dir = nvim_lsp.util.root_pattern(".git", "go.mod"),
			init_options = {
				command = {
					"golangci-lint",
					"run",
					"--enable-all",
					"--disable",
					"lll",
					"--out-format",
					"json",
					"--issues-exit-code=1",
				},
			},
		},
	}
end

for _, lsp in ipairs(servers) do
	if lsp == "golangci_lint_ls" then
		nvim_lsp[lsp].setup({ filetypes = { "go", "gomod" } })
	elseif lsp == "wgsl_analyzer" then
		nvim_lsp[lsp].setup({
			settings = {
				["wgsl-analyzer"] = {
					diagnostics = {
						typeErrors = true,
						nagaParsingErrors = true,
						nagaValidationErrors = true,
					},
				},
			},
			on_attach = on_attach,
		})
	elseif lsp == "denols" then
		nvim_lsp[lsp].setup({
			on_attach = on_attach,
			root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
		})
	elseif lsp == "sqls" then
		nvim_lsp.sqls.setup({
			settings = {
				sqls = {
					connections = {
						{
							driver = "postgresql",
							dataSourceName = "host=localhost port=5433 user=postgres password=password dbname=postgres sslmode=disable",
						},
					},
				},
			},
			on_attach = function(client, bufnr)
				require("sqls").on_attach(client, bufnr)
			end,
		})
	elseif lsp == "sqlls" then
		nvim_lsp[lsp].setup({
			on_attach = on_attach,
			cmd = { "sql-language-server", "up", "--method", "stdio" },
		})
	elseif lsp == "gopls" then
		nvim_lsp["gopls"].setup({
			cmd = { "gopls" },
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				gopls = {
					experimentalPostfixCompletions = true,
					analyses = {
						unusedparams = true,
						shadow = true,
					},
					staticcheck = true,
				},
			},
			init_options = {
				usePlaceholders = true,
			},
		})
	else
		nvim_lsp[lsp].setup({
			on_attach = on_attach,
			flags = {
				debounce_text_changes = 150,
			},
			settings = {
				gopls = {
					gofumpt = true,
				},
			},
			capabilities = table.insert(cmp_lsp.default_capabilities(), capabilities),
		})
	end
end

nvim_lsp["bufls"].setup({
	on_attach = on_attach,
	flags = {
		debounce_text_changes = 150,
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

M.on_attach = on_attach

return M
