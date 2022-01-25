require 'kadobot.lspkind'

local nvim_lsp = require 'lspconfig'
local cmp_lsp = require'cmp_nvim_lsp'
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
capabilities.textDocument.codeAction = {
    dynamicRegistration = true,
    codeActionLiteralSupport = {
        codeActionKind = {
            valueSet = (function ()
                local res = vim.tbl_values(vim.lsp.protocol.CodeActionKind)
                table.sort(res)
                return res
            end)()
        }
    }
}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    if client.name == "tsserver" then
        client.resolved_capabilities.document_formatting = false

        -- vim.cmd([[
        --     augroup Format
        --         autocmd! * <buffer>
        --         autocmd BufWritePre <buffer> :Prettier()
        --     augroup END
        -- ]])
    end

    if client.resolved_capabilities.call_hierarchy then
        vim.cmd [[command! -buffer LspIncomingCalls lua vim.lsp.buf.incoming_calls()]]
        vim.cmd [[command! -buffer LspOutgoingCalls lua vim.lsp.buf.outgoing_calls()]]
    end

    if client.resolved_capabilities.document_highlight then
        vim.cmd [[
        augroup lsp_document_highlight
            autocmd! * <buffer>
            autocmd CursorHold   <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorHoldI  <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved  <buffer> lua vim.lsp.buf.clear_references()
            autocmd CursorMovedI <buffer> lua vim.lsp.buf.clear_references()
        augroup END
        ]]
    end

    if client.resolved_capabilities.document_formatting then
        vim.cmd([[
            augroup Format
                autocmd!
                autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()
            augroup END
        ]])
    end

    vim.lsp.handlers["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = "rounded"})
    vim.lsp.handlers["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = "rounded"})

    -- Diagnostics
    local config = {
        virtual_text = false,
        signs = true,
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = ""
        }
    }
    vim.diagnostic.config(config)

    -- require('lspsaga').init_lsp_saga({
    --     rename_action_keys = { quit = '<ESC>', exec = '<CR>' },
    --     rename_prompt_prefix = '',
    --     code_action_prompt = {
    --         enable = true,
    --         sign = false,
    --         sign_priority = 20,
    --         virtual_text = false,
    --     },
    -- })
end

require 'lsp_signature'.setup({
    bind = true,
    hint_enable = true,
    floating_window = false,
    hint_scheme = "String",
    hint_prefix = "諸"
})


-- See `:help vim.lsp.*` for documentation on any of the below functions
wk.register({
    ['K'] = {"<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", 'Hover Doc'},
    -- ['K'] = {'<cmd>lua vim.lsp.buf.hover()<CR>', 'Hover Doc'},
})
wk.register({
    ['D'] = {':Telescope lsp_definitions<CR>', 'Go to definition' },
    ['d'] = {'<cmd>lua require("lspsaga.provider").preview_definition()<CR>', 'Preview definition'},
    ['i'] = {':Telescope lsp_implementations<CR>', 'Go to implementation'},
    ['r'] = {'<cmd>lua require("lspsaga.rename").rename()<CR>', 'Rename'},
    -- ['r'] = {'<cmd>lua vim.lsp.buf.rename()<CR>', 'Rename'},
    ['R'] = {':Telescope lsp_references<CR>', 'References'},
    ['s'] = {'<cmd>lua require("lspsaga.signaturehelp").signature_help()<CR>', 'Signature Help'},
    -- ['s'] = {'<cmd>lua vim.lsp.buf.signature_help()<CR>', 'Signature Help'},
    ['y'] = {':Telescope lsp_document_symbols<CR>', 'Document symbols'},
    ['Y'] = {':Telescope lsp_dynamic_workspace_symbols<CR>', 'Workspace Symbols'},
    ['t'] = {':Telescope lsp_type_definitions<CR>', 'Type Definition'},
    ['x'] = {':Telescope lsp_code_actions<CR>', 'Code Actions'},
    -- ['z'] = {'<cmd>lua require"lspsaga.diagnostic".show_line_diagnostics()<CR>', 'Line Diagnostics'},
    ['z'] = {'<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', 'Line Diagnostics'},
    ['o'] = {':Telescope lsp_document_diagnostics<CR>', 'Document Diagnostics'},
    ['O'] = {':Telescope lsp_workspace_diagnostics<CR>', 'Workspace Diagnostics'},
    -- ['n'] = {'<cmd>lua require"lspsaga.diagnostic".lsp_jump_diagnostic_next()<CR>', 'Go to next diagnostic'},
    -- ['p'] = {'<cmd>lua require"lspsaga.diagnostic".lsp_jump_diagnostic_prev()<CR>', 'Go to prev diagnostic'},
    ['n'] = {'<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', 'Go to prev diagnostic'},
    ['p'] = {'<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', 'Go to prev diagnostic'},
    ['f'] = {'<cmd>lua vim.lsp.buf.formatting()<CR>', 'Format Buffer'},
    ['h'] = {"<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", 'Lsp Finder'},
    ['L'] = {'<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', 'Set loclist'},
}, { prefix = "g" })

wk.register({
    ['x'] = {':Telescope lsp_range_code_actions<CR>', 'Code Actions'},
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
    ['f'] = {'<cmd>lua vim.lsp.buf.formatting()<CR>', 'Format Buffer'},
}, { prefix = '<leader>c' })


-- Use a loop to conveniently call 'setup' on multiple servers and
local servers = { 'tsserver', 'vimls', 'jsonls', 'yamlls', 'eslint', 'gopls' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    capabilities = cmp_lsp.update_capabilities(capabilities)
  }
end

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
