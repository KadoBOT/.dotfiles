-- Register linters and formatters per language
local prettier = require('efmls-configs.formatters.prettier')
local stylua = require('efmls-configs.formatters.stylua')
local biome = require('efmls-configs.formatters.biome')
local flake8 = require('efmls-configs.linters.flake8')
local autopep8 = require('efmls-configs.formatters.autopep8')

local languages = {
    typescript = { prettier, biome },
    python = { flake8, autopep8 },
    lua = { stylua },
}

-- Or use the defaults provided by this plugin
-- check doc/SUPPORTED_LIST.md for the supported languages
--
-- local languages = require('efmls-configs.defaults').languages()

local efmls_config = {
    filetypes = vim.tbl_keys(languages),
    settings = {
        rootMarkers = { '.git/' },
        languages = languages,
    },
    init_options = {
        documentFormatting = true,
        documentRangeFormatting = true,
    },
}

require('lspconfig').efm.setup(vim.tbl_extend('force', efmls_config, {
    -- Pass your custom lsp config below like on_attach and capabilities
    --
    -- on_attach = on_attach,
    -- capabilities = capabilities,
}))
