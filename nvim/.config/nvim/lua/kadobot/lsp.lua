local nvim_lsp = require 'lspconfig'
local wk = require 'which-key'

local sumneko_root_path = '/Users/ricardoambrogi/Projects/lua-language-server'
local sumneko_binary = sumneko_root_path .. '/bin/macOS/lua-language-server'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  if client.resolved_capabilities.code_lens then
    vim.cmd [[
    augroup CodeLens
      au!
      au InsertEnter,InsertLeave * lua vim.lsp.codelens.refresh()
    augroup END
    ]]
  end

  if client.resolved_capabilities.call_hierarchy then
    vim.cmd([[command! -buffer LspIncomingCalls lua vim.lsp.buf.incoming_calls()]])
    vim.cmd([[command! -buffer LspOutgoingCalls lua vim.lsp.buf.outgoing_calls()]])
  end

  if client.resolved_capabilities.document_highlight then
    vim.cmd [[
    augroup LSPDocumentHighlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
    ]]
  end

  require 'lsp_signature'.on_attach({
    bind = false,
    hint_enable = false,
    use_lspsaga = true,
    doc_lines = 4,
    floating_window_above_cur_line = false,
    handler_opts = {
      border = "single" -- double, single, shadow, none
    },
    auto_close_after = 5,
    fix_pos = true,
    hint_scheme = "Function",
    hi_parameter = "IncSearch"
    }, bufnr)

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  wk.register({
    ['K'] = {':Lspsaga hover_doc<CR>', 'Hover Doc'},
  })
  wk.register({
    ['D'] = {'<cmd>lua vim.lsp.buf.definition()<CR>', 'Go to declaration' },
    ['d'] = {':Lspsaga preview_definition<CR>', 'Preview definition'},
    ['i'] = {'<cmd>lua vim.lsp.buf.implementation()<CR>,', 'Go to implementation'},
    ['r'] = {':Lspsaga rename<CR>', 'Rename'},
    ['R'] = {'<cmd>lua vim.lsp.buf.references()<CR>', 'References'},
    ['s'] = {':Lspsaga signature_help<CR>', 'Signature Help'},
    ['w'] = {'<cmd>lua vim.lsp.buf.document_symbol()<CR>', 'Document symbol'},
    ['W'] = {'<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', 'Workspace Symbol'},
    ['t'] = {':Lspsaga type_definition<CR>', 'Type Definition'},
    ['x'] = {':Lspsaga code_action<CR>', 'Code Action'},
    ['o'] = {':Lspsaga show_line_diagnostics<CR>', 'Line Diagnostics'},
    ['z'] = {':Lspsaga diagnostic_jump_next<CR>', 'Go to next diagnostic'},
    ['l'] = {':Lspsaga diagnostic_jump_prev<CR>', 'Go to prev diagnostic'},
    ['f'] = {'<cmd>lua vim.lsp.buf.formatting()<CR>', 'Format Buffer'},
    ['h'] = {':Lspsaga lsp_finder<CR>', 'Lsp Finder'},
    ['L'] = {'<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', 'Set loclist'},
  }, { prefix = "g" })

  wk.register({
    ["x"] = {':Lspsaga range_code_action<CR>', 'Code Action'},
    ['f'] = {'<cmd>lua vim.lsp.buf.range_formatting()<CR>', 'Format Buffer'},
  }, { prefix = "g", mode = "v" })

  wk.register({
    name = "Workspace",
    ['a'] = {'<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', 'Add folder'},
    ['r'] = {'<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', 'Remove Workspace Folder'},
    ['l'] = {'<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', 'List Workspace Folders'},
  }, { prefix = "<leader>=" })

  wk.register({
    name = "Code",
    ['r'] = {'<cmd>lua vim.lsp.buf.rename()<CR>', 'Rename'},
    ['a'] = {'<cmd>lua vim.lsp.buf.code_action()<CR>', 'Code Action'},
  }, { prefix = '<leader>c' })

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'tsserver', 'vimls', 'jsonls', 'yamlls', 'eslint' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    capabilities = capabilities
  }
end

vim.cmd[[autocmd BufWritePre *js,*ts,*jsx,*tsx,*.graphql,*.json,*.md,*.mdx,*.svelte,*.yml,*yaml :PrettierAsync]]

nvim_lsp.sumneko_lua.setup {
  on_attach = on_attach,
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
  settings = {
      Lua = {
          runtime = {
              -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
              version = 'LuaJIT',
              -- Setup your lua path
              path = vim.split(package.path, ';'),
          },
          diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = {'vim'},
          },
          workspace = {
              -- Make the server aware of Neovim runtime files
              library = {
                  [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                  [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
              },
          },
      },
  }
}

vim.lsp.handlers["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = "single"})
vim.lsp.handlers["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = "single"})

-- Diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    --defines error in line via keybinding
        virtual_text = {
            prefix = "ﱢ",
            spacing = 0,
        },
    signs = true,
    update_in_insert = false,
    underline = true
  }
)

local signs = {
  Error = " ",
  Warning = " ",
  Hint = "ﯦ ",
  Information = " ",
}

for type, icon in pairs(signs) do
  local hl = "LspDiagnosticsSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
