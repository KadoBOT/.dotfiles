local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function (use)
    use 'lewis6991/impatient.nvim'
    use 'wbthomason/packer.nvim'
    use 'folke/which-key.nvim'
    use {'arcticicestudio/nord-vim', opt = true }
    use {'christianchiarulli/nvcode-color-schemes.vim', opt = true }
    use 'christoomey/vim-tmux-navigator'
    use 'DataWraith/auto_mkdir'
    use {'folke/trouble.nvim', config = [[require('kadobot.trouble')]]}
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-calc',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-path',
            'onsails/lspkind-nvim',
            {'hrsh7th/vim-vsnip', opt = true }
        },
        config = [[require('kadobot.cmp')]]
    }
    use {
        'romgrk/barbar.nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = [[require('kadobot.barbar')]]
    }
    -- use {
    --     'akinsho/bufferline.nvim',
    --     requires = { 'kyazdani42/nvim-web-devicons' },
    --     config = [[require('kadobot.bufferline')]],
    -- }
    use {
        'itchyny/lightline.vim',
        requires = {
            { 'kyazdani42/nvim-web-devicons', opt = true },
            'tpope/vim-fugitive',
            'airblade/vim-gitgutter'
        },
        config = [[require('kadobot.lightline')]],
    }
    use 'itchyny/vim-gitbranch'
    use 'mbbill/undotree'
    use {'glepnir/dashboard-nvim', setup = [[vim.g.dashboard_default_executive = "telescope"]] }
    use {
        'neovim/nvim-lspconfig',
        requires = {
            'tami5/lspsaga.nvim',
            'ray-x/lsp_signature.nvim',
            'onsails/lspkind-nvim',
            'jose-elias-alvarez/nvim-lsp-ts-utils',
            'hrsh7th/nvim-cmp',
        },
        config = [[require('kadobot.lsp')]]
    }
    use {'NTBBloodbath/doom-one.nvim', config = [[require('kadobot.doom-one')]], opt = true }
    use {'navarasu/onedark.nvim', opt = true}
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-telescope/telescope-frecency.nvim',
            'nvim-lua/plenary.nvim',
            'nvim-lua/popup.nvim',
        },
        config = [[require('kadobot.telescope')]]
    }
    use {
        'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
        requires = {
            { 'nvim-treesitter/nvim-treesitter-refactor', opt = true },
            { 'nvim-treesitter/playground', opt = true },
            'neovim/nvim-lspconfig'
        },
        config = [[require('kadobot.treesitter')]]
    }
    use {'ggandor/lightspeed.nvim', config = [[require('kadobot.lightspeed')]] }
    use 'prettier/vim-prettier'
    use 'psliwka/vim-smoothie'
    use 'Raimondi/delimitMate'
    use { 'RRethy/vim-hexokinase', run = 'make hexokinase' }
    use 'sheerun/vim-polyglot'
    use 'tami5/sql.nvim'
    use 'tpope/vim-commentary'
    use 'tpope/vim-eunuch'
    use {'Yggdroot/indentLine', setup = [[vim.g.indentLine_fileTypeExclude = {'dashboard'}]]}

  if packer_bootstrap then
    require('packer').sync()
  end
end)
