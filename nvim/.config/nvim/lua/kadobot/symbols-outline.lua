local wk = require('which-key')

wk.register({
    [","] = {"<cmd>SymbolsOutline<CR>", "Symbols"}
})

vim.cmd[[highlight FocusedSymbol guibg=#2F2A4F]]
vim.g.symbols_outline = {
    show_symbol_details = false,
    width = 50,
    auto_preview = false
}
