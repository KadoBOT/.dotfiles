local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function (use)
    use {'lewis6991/impatient.nvim'}
    use {'wbthomason/packer.nvim'}
    use {'arcticicestudio/nord-vim', opt = true }
    use {'christianchiarulli/nvcode-color-schemes.vim', opt = true }
    use {'christoomey/vim-tmux-navigator'}
    use {'dataWraith/auto_mkdir'}
    use {'folke/trouble.nvim', config = [[require('kadobot.trouble')]]}
    use {'folke/which-key.nvim'}
    use {'folke/tokyonight.nvim'}
    use {'ggandor/lightspeed.nvim', config = [[require('kadobot.lightspeed')]] }
    use {'glepnir/dashboard-nvim', config = [[require('kadobot.dashboard')]] }
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            {'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
            {'hrsh7th/cmp-calc', after = 'nvim-cmp' },
            'hrsh7th/cmp-nvim-lsp',
            {'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
            {'hrsh7th/cmp-path', after = 'nvim-cmp' },
            'onsails/lspkind-nvim',
            {'hrsh7th/vim-vsnip', after = 'nvim-cmp' },
        },
        config = [[require('kadobot.cmp')]]
    }
    use {'kyazdani42/nvim-web-devicons' }
    use {'luukvbaal/stabilize.nvim', config = function () require('stabilize').setup() end }
    use {'mbbill/undotree'}
    use {'nTBBloodbath/doom-one.nvim', config = [[require('kadobot.doom-one')]], opt = true }
    use {'navarasu/onedark.nvim', opt = true}
    use {
        'neovim/nvim-lspconfig',
        requires = {
            'tami5/lspsaga.nvim',
            'ray-x/lsp_signature.nvim',
            'onsails/lspkind-nvim',
            'hrsh7th/nvim-cmp'
        },
        config = [[require('kadobot.lsp')]]
    }
    use {
        'noib3/cokeline.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons',
            'neovim/nvim-lspconfig'
        },
        config = [[require('kadobot.cokeline')]]
    }
    use {
        'norcalli/nvim-colorizer.lua',
        config = [[require('colorizer').setup {'css', 'javascript', 'vim', 'html', 'typescript'}]],
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            { 'kyazdani42/nvim-web-devicons', opt = true },
            'tpope/vim-fugitive'
        },
        config = [[require('kadobot.lualine')]]
    }
    use {
        {
            'nvim-telescope/telescope.nvim',
            requires = {
                'telescope-frecency.nvim',
                'telescope-project.nvim',
                'nvim-lua/plenary.nvim',
                'nvim-lua/popup.nvim'
            },
            wants = {
                'popup.nvim',
                'plenary.nvim',
                'telescope-frecency.nvim',
                'telescope-project.nvim'
            },
            config = [[require('kadobot.telescope')]],
            setup = [[require('kadobot.telescope_setup')]],
            cmd = 'Telescope',
            module = 'telescope'
        },
        {
            'nvim-telescope/telescope-project.nvim',
            after = 'telescope.nvim',
        },
        {
            'nvim-telescope/telescope-frecency.nvim',
            after = 'telescope.nvim',
            requires = 'tami5/sql.nvim',
        },
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        requires = {
            { 'nvim-treesitter/nvim-treesitter-refactor', opt = true },
            { 'nvim-treesitter/playground', opt = true },
            'neovim/nvim-lspconfig'
        },
        config = [[require('kadobot.treesitter')]]
    }
    use {'prettier/vim-prettier'}
    use {'psliwka/vim-smoothie'}
    use {'raimondi/delimitMate'}
    use {'tpope/vim-commentary'}
    use {'tpope/vim-eunuch'}
    use {
        { 'tpope/vim-fugitive', cmd = { 'Git', 'Gstatus', 'Gblame', 'Gpush', 'Gpull' }, disable = true },
        {
            'lewis6991/gitsigns.nvim',
            requires = { 'nvim-lua/plenary.nvim' },
            config = [[require('kadobot.gitsigns')]],
        },
        { 'TimUntersberger/neogit', cmd = 'Neogit', config = [[require('kadobot.neogit')]] },
    }
    use {'yggdroot/indentLine', setup = [[vim.g.indentLine_fileTypeExclude = {'dashboard'}]]}

    if packer_bootstrap then
        require('packer').sync()
    end
end)
