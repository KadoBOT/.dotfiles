local cmp = require('cmp')
local lspkind = require('lspkind')
-- local cmp_autopairs = require('nvim-autopairs.completion.cmp')

-- cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
cmp.setup {
    snippet = {
        expand = function(args)
            -- You must install `vim-vsnip` if you use the following as-is.
            vim.fn['vsnip#anonymous'](args.body)
        end
    },

    -- You must set mapping if you want.
    mapping = {
        ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
        ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
        ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-s>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-e>'] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),
        ['<CR>'] = cmp.mapping.confirm({
            select = true,
        }),
        ['<Tab>'] = cmp.mapping(function (fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function (fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, { 'i', 's' })
    },

    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            vim_item.kind = string.format("%s %s", lspkind.presets.default[vim_item.kind], vim_item.kind)
            vim_item.menu = ({
                -- nvim_lsp = "[LSP]",
                -- nvim_lua = "[Nvim]",
                -- luasnip = "[Snippet]",
                -- buffer = "[Buffer]",
                -- path = "[Path]",
                -- emoji = "[Emoji]",

                nvim_lsp = "",
                nvim_lua = "",
                luasnip = "",
                buffer = "",
                path = "",
                emoji = "",
            })[entry.source.name]

            return vim_item
        end
    },
    -- You should specify your *installed* sources.
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'path' },
    }, {
        {
            -- name = 'fuzzy_buffer',
            name = 'buffer',
            options = {
                get_bufnrs = function()
                    local bufs = {}
                    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                        local buftype = vim.api.nvim_buf_get_option(buf, 'buftype')
                        if buftype ~= 'nofile' and buftype ~= 'prompt' then
                            bufs[#bufs + 1] = buf
                        end
                    end
                    return bufs
                end,
            },
        },
    }),
    completion = {
        keyword_length = 3,
    },
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
    documentation = false,
    experimental = {
        ghost_text = true,
        native_menu = false
    }
}

local config = {
  sources = cmp.config.sources({
    {
      -- name = 'fuzzy_buffer',
      name = 'buffer',
      options = {
        get_bufnrs = function()
          return { vim.api.nvim_get_current_buf() }
        end,
      },
    },
  }, {
    { name = 'nvim_lsp_document_symbol' },
  }),
}

cmp.setup.cmdline('/', config)
cmp.setup.cmdline('?', config)
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    -- { name = 'fuzzy_path' },
    { name = 'path' },
  }, {
    { name = 'cmdline' },
  }),
})
