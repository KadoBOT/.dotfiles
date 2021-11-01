require('trouble').setup {}

vim.api.nvim_set_keymap('n', ';xx', '<cmd>TroubleToggle<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>cD', '<cmd>TroubleToggle lsp_workspace_diagnostics<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>cd', '<cmd>TroubleToggle lsp_document_diagnostics<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>cq', '<cmd>TroubleToggle quickfix<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>cl', '<cmd>TroubleToggle loclist<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>cR', '<cmd>TroubleToggle lsp_references<CR>', {noremap = true})
