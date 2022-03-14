local cmp = require("cmp")
local cmp_buffer = require("cmp_buffer")
local lspkind = require("lspkind")

local cmp_autopairs = require("nvim-autopairs.completion.cmp")

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
cmp.setup({
	snippet = {
		expand = function(args)
			-- You must install `vim-vsnip` if you use the following as-is.
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	mapping = {
		["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Replace }), { "i", "c" }),
		["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Replace }), { "i", "c" }),
		["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete({ reason = cmp.ContextReason.Manual }), { "i", "c" }),
		["<C-e>"] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),
		["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, { "i", "s" }),
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = lspkind.cmp_format({
			icon = true,
			with_text = false,
			menu = {
				buffer = " ﬘",
				nvim_lsp = " ",
				nvim_lsp_signature_help = " ﯳ",
				luasnip = " 🐍",
				treesitter = " ",
				nvim_lua = " ",
				spell = " 暈",
			},
			before = function(entry, vim_item)
				local duplicates = {
					buffer = 1,
					luasnip = 1,
					nvim_lsp = 0,
					nvim_lua = 1,
					nvim_lsp_document_symbol = 1,
					nvim_lsp_signature_help = 1,
					path = 1,
				}

				vim_item.dup = duplicates[entry.source.name] or 0
				return vim_item
			end,
		}),
	},
	-- You should specify your *installed* sources.
	sources = cmp.config.sources({
		{ name = "nvim_lsp_signature_help", priority_weight = 100 },
		{ name = "nvim_lsp", priority_weight = 110 },
		{ name = "treesitter", max_item_count = 10, keyword_length = 2, priority_weight = 90 },
		{ name = "nvim_lua", priority_weight = 99 },
	}, {
		{ name = "nvim_lsp_document_symbol", priority_weight = 95 },
		{ name = "path", priority_weight = 92 },
		{
			-- name = 'fuzzy_buffer',
			name = "buffer",
			options = {
				get_bufnrs = function()
					local bufs = {}
					for _, buf in ipairs(vim.api.nvim_list_bufs()) do
						local buftype = vim.api.nvim_buf_get_option(buf, "buftype")
						if buftype ~= "nofile" and buftype ~= "prompt" then
							bufs[#bufs + 1] = buf
						end
					end
					return bufs
				end,
			},
			priority_weight = 70,
		},
		{ name = "luasnip", priority_weight = 80 },
		{ name = "emoji", priority_weight = 60 },
	}),
	completion = {
		keyword_length = 1,
		autocomplete = { require("cmp.types").cmp.TriggerEvent.TextChanged },
		completeopt = "menu,menuone,noselect",
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	documentation = {
		border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
	},
	experimental = {
		ghost_text = true,
		native_menu = false,
	},
	sorting = {
		priority_weight = 2,
		comparators = {
			cmp.config.compare.score,
			cmp.config.compare.exact,
			cmp.config.compare.offset,
			function(...)
				return cmp_buffer:compare_locality(...)
			end,
			cmp.config.compare.recently_used,
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
	preselect = cmp.PreselectMode.None,
})

cmp.setup.cmdline("/", {
	sources = cmp.config.sources({
		{ name = "nvim_lsp_document_symbol" },
	}, {
		{ name = "buffer" },
	}),
})

cmp.setup.cmdline("?", {
	sources = {
		{ name = "buffer" },
	},
})

cmp.setup.cmdline(":", {
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline", keyword_length = 2, max_item_count = 50 },
		{ name = "cmdline_history", max_item_count = 5 },
	}),
})
