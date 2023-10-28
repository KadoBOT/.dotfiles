vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })

local cmp = require("cmp")
local cmp_buffer = require("cmp_buffer")
local kind = require("lspkind")

local cmp_autopairs = require("nvim-autopairs.completion.cmp")

-- if codicons is not available use the ones below
-- local icons = {
-- 	Text = "  ",
-- 	Method = "  ",
-- 	Function = "  ",
-- 	Constructor = "⌘  ",
-- 	Field = "ﰠ  ",
-- 	Variable = "  ",
-- 	Class = "ﴯ  ",
-- 	Interface = "  ",
-- 	Module = "  ",
-- 	Property = "ﰠ  ",
-- 	Unit = "塞 ",
-- 	Value = "  ",
-- 	Enum = "  ",
-- 	Keyword = "廓 ",
-- 	Snippet = "  ",
-- 	Color = "  ",
-- 	File = "  ",
-- 	Reference = "  ",
-- 	Folder = "  ",
-- 	EnumMember = "  ",
-- 	Constant = "  ",
-- 	Struct = "פּ  ",
-- 	Event = " ",
-- 	Operator = "  ",
-- 	TypeParameter = "t ",
-- }

local icons = {
	Text = "  ",
	Method = "  ",
	Function = "  ",
	Constructor = "  ",
	Field = "  ",
	Variable = "  ",
	Class = "  ",
	Interface = "  ",
	Module = "  ",
	Property = "  ",
	Unit = "  ",
	Value = "  ",
	Enum = "  ",
	Keyword = "  ",
	Snippet = "  ",
	Color = "  ",
	File = "  ",
	Reference = "  ",
	Folder = "  ",
	EnumMember = "  ",
	Constant = "  ",
	Struct = "  ",
	Event = "  ",
	Operator = "  ",
	TypeParameter = "  ",
}

-- gray
vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { bg = "NONE", strikethrough = true, fg = "#808080" })

-- blue
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { bg = "NONE", fg = "#7E9CD8" })
vim.api.nvim_set_hl(0, "CmpItemAbbrFuzzy", { bg = "NONE", fg = "#7E9CD8" })

-- light blue
vim.api.nvim_set_hl(0, "CmpItemKindVariable", { bg = "NONE", fg = "#7FB4CA" })
vim.api.nvim_set_hl(0, "CmpItemKindInterface", { bg = "NONE", fg = "#7FB4CA" })
vim.api.nvim_set_hl(0, "CmpItemKindText", { bg = "NONE", fg = "#7FB4CA" })

-- magenta
vim.api.nvim_set_hl(0, "CmpItemKindFunction", { bg = "NONE", fg = "#957FB8" })
vim.api.nvim_set_hl(0, "CmpItemKindMethod", { bg = "NONE", fg = "#957FB8" })

-- white
vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { bg = "NONE", fg = "#C8C093" })
vim.api.nvim_set_hl(0, "CmpItemKindProperty", { bg = "NONE", fg = "#C8C093" })
vim.api.nvim_set_hl(0, "CmpItemKindUnit", { bg = "NONE", fg = "#C8C093" })

local handlers = require("nvim-autopairs.completion.handlers")
cmp.event:on(
	"confirm_done",
	cmp_autopairs.on_confirm_done({
		filetypes = {
			-- "*" is a alias to all filetypes
			["*"] = {
				["("] = {
					kind = {
						cmp.lsp.CompletionItemKind.Function,
						cmp.lsp.CompletionItemKind.Method,
					},
					handler = handlers["*"],
				},
			},
			-- Disable for tex
			tex = false,
		},
	})
)
cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-l>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				return cmp.complete_common_string()
			end
			fallback()
		end, { "i", "c" }),
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<C-s>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item({ behavior = cmp.ConfirmBehavior.Insert })
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item({ behavior = cmp.ConfirmBehavior.Insert })
			else
				fallback()
			end
		end,
	}),
	formatting = {
		fields = { "abbr", "kind" },
		format = kind.cmp_format({
			icon = true,
			with_text = true,
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
				vim_item.kind = (icons[vim_item.kind] or "") .. vim_item.kind

				return vim_item
			end,
		}),
	},
	-- You should specify your *installed* sources.
	sources = cmp.config.sources({
		{ name = "nvim_lsp", priority_weight = 110, group_index = 1 },
		{ name = "luasnip", priority_weight = 105, group_index = 1 },
		{ name = "treesitter", max_item_count = 10, keyword_length = 2, priority_weight = 102, group_index = 1 },
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
		completion = vim.tbl_deep_extend("force", cmp.config.window.bordered(), { col_offset = -1 }),
	},
	experimental = {
		native_menu = false,
		ghost_text = false,
	},
	view = {
		entries = cmp.EntriesConfig,
	},
	sorting = {
		priority_weight = 2,
		comparators = {
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.score,
			function(entry1, entry2)
				local _, entry1_under = entry1.completion_item.label:find("^_+")
				local _, entry2_under = entry2.completion_item.label:find("^_+")
				entry1_under = entry1_under or 0
				entry2_under = entry2_under or 0
				if entry1_under > entry2_under then
					return false
				elseif entry1_under < entry2_under then
					return true
				end
			end,
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
	preselect = cmp.PreselectMode.None,
})

cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "buffer" },
	}, {
		{ name = "nvim_lsp_document_symbol" },
	}),
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
