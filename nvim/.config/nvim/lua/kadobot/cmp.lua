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
            behavior = cmp.ConfirmBehavior.Replace,
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
            vim_item.kind = lspkind.presets.default[vim_item.kind] .. " " .. vim_item.kind

            return vim_item
        end
    },
    -- You should specify your *installed* sources.
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'nvim_lua' },
        { name = 'rg'}
    },
    completion = {
        keyword_length = 1,
    }
}
