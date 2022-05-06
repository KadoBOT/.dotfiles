require('trouble').setup {
    action_keys = {
        previous = 'j',
        next = 'h',
        toggle_fold = {"kA","ka"}
    },
    use_diagnostic_signs = true
}

local wk = require('which-key')

wk.register({
  ['<leader>c'] = { name = "Code" },
  ['<leader>cT'] = { '<cmd>TroubleToggle<CR>', "Trouble Toggle" },
  ['<leader>cW'] = { '<cmd>TroubleToggle workspace_diagnostics<CR>', "Workspace Diagnostics" },
  ['<leader>cD'] = { '<cmd>TroubleToggle document_diagnostics<CR>', "Document Diagnostics" },
  ['<leader>ce'] = { '<cmd>TroubleToggle quickfix<CR>', "Quickfix" },
  ['<leader>cq'] = { '<cmd>TroubleToggle loclist<CR>', "Loclist" },
  ['<leader>cR'] = { '<cmd>TroubleToggle lsp_references<CR>', "References" },
  ['<leader>cd'] = { '<cmd>TroubleToggle lsp_definitions<cr>', "Definitions" },
  ['<leader>ct'] = { '<cmd>TroubleToggle lsp_type_definitions<cr>', "Type Definitions" },
  ['<leader>ci'] = { '<cmd>TroubleToggle lsp_implementations<cr>', "Implementations" },
})
