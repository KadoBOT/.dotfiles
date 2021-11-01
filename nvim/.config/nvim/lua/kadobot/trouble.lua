require('trouble').setup {}
local wk = require('which-key')

wk.register({
  ['<leader>c'] = { name = "Code" },
  ['<leader>cT'] = { '<cmd>TroubleToggle<CR>', "Trouble Toggle" },
  ['<leader>cD'] = { '<cmd>TroubleToggle lsp_workspace_diagnostics<CR>', "Workspace Diagnostics" },
  ['<leader>cd'] = { '<cmd>TroubleToggle lsp_document_diagnostics<CR>', "Document Diagnostics" },
  ['<leader>cq'] = { '<cmd>TroubleToggle quickfix<CR>', "Quickfix" },
  ['<leader>cl'] = { '<cmd>TroubleToggle loclist<CR>', "Loclist" },
  ['<leader>cR'] = { '<cmd>TroubleToggle lsp_references<CR>', "References" },
  ['<leader>ce'] = { '<cmd>TroubleToggle lsp_definitions<cr>', "Definitions" },
  ['<leader>ci'] = { '<cmd>TroubleToggle lsp_implementations<cr>', "Implementations" },
})