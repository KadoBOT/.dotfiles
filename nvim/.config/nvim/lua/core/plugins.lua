local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function (use)
  use 'lewis6991/impatient.nvim'
  use 'wbthomason/packer.nvim'
  use {'arcticicestudio/nord-vim', opt = true }
  use {'christianchiarulli/nvcode-color-schemes.vim', opt = true }
  use 'christoomey/vim-tmux-navigator'
  use {'DataWraith/auto_mkdir', opt = true }
  use 'folke/trouble.nvim'
  use 'folke/which-key.nvim'
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-calc',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-path',
      {'hrsh7th/vim-vsnip', opt = true }
    }
  }
  use {
    'romgrk/barbar.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }
  use {
    'itchyny/lightline.vim',
    requires = {
      { 'kyazdani42/nvim-web-devicons', opt = true },
      'tpope/vim-fugitive',
      'airblade/vim-gitgutter'
    }
  }
  use {'itchyny/vim-gitbranch', opt = true }
  use 'mbbill/undotree'
  use 'mhinz/vim-startify'
  use {
    'neovim/nvim-lspconfig',
    requires = {
      'tami5/lspsaga.nvim',
      'ray-x/lsp_signature.nvim',
      'onsails/lspkind-nvim'
    }
  }
  use 'NTBBloodbath/doom-one.nvim'
  use 'joshdick/onedark.vim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-telescope/telescope-frecency.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-lua/popup.nvim',
    }
  }
  use {
    'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
    requires = {
      { 'nvim-treesitter/nvim-treesitter-refactor', opt = true },
      { 'nvim-treesitter/playground', opt = true },
      'neovim/nvim-lspconfig'
    }
  }
  use 'phaazon/hop.nvim'
  use {'prettier/vim-prettier', opt = true }
  use {'psliwka/vim-smoothie', opt = true }
  use {'Raimondi/delimitMate', opt = true }
  use { 'RRethy/vim-hexokinase', run = 'make hexokinase', opt = true }
  use 'sheerun/vim-polyglot'
  use 'tami5/sql.nvim'
  use {'tpope/vim-commentary', opt = true }
  use {'tpope/vim-eunuch', opt = true }
  use {'Yggdroot/indentLine', opt = true }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
