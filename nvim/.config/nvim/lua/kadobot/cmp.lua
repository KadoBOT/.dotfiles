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
	mapping = cmp.mapping.preset.insert({
		["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Replace }),
		["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Replace }),
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<C-s>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
            else
                fallback()
			end
		end,
	}),
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
		{ name = "nvim_lsp", priority_weight = 110, group_index = 1, max_item_count = 25 },
		{ name = "vsnip", priority_weight = 105, group_index = 1 },
        { name = "treesitter", max_item_count = 10, keyword_length = 2, priority_weight = 102, group_index = 1 },
        { name = "nvim_lsp_document_symbol", priority_weight = 98, group_index = 1 },
        { name = "nvim_lsp_signature_help", priority_weight = 97, group_index = 2 },
		{ name = "nvim_lua", priority_weight = 95, group_index = 2 },
	}, {
		{ name = "path", priority_weight = 92, group_index = 2 },
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
			group_index = 2,
		},
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
	window = {
		documentation = cmp.config.window.bordered(),
		completion = cmp.config.window.bordered(),
	},
	experimental = {
		ghost_text = true,
	},
	view = {
		entries = cmp.EntriesConfig,
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
    mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "buffer" },
	}, {
		{ name = "nvim_lsp_document_symbol" },
    }),
})

cmp.setup.cmdline("?", {
    mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	}, {
		{ name = "nvim_lsp_document_symbol" },
    },
})

cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline", keyword_length = 2, max_item_count = 50 },
		{ name = "cmdline_history", max_item_count = 5 },
	}),
})
