vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

require('core.plugins')
require('core.settings')

require("kadobot.lsp")
require("kadobot.telescope")
require("kadobot.lightline")
require("kadobot.treesitter")
require("kadobot.cmp")
require("kadobot.barbar")
require("kadobot.hop")
require("kadobot.doom-one")
require("kadobot.trouble")
require("kadobot.mappings")
