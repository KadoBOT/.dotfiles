local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    Packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function (use)
    use {
        {
            'lewis6991/impatient.nvim',
            config = function ()
                require('impatient').enable_profile()
            end,
        },
        'wbthomason/packer.nvim',
        'nathom/filetype.nvim',
        'nvim-lua/plenary.nvim',
    }

    use {
        { 'arcticicestudio/nord-vim', opt = true },
        {'nTBBloodbath/doom-one.nvim', config = [[require('kadobot.doom-one')]], opt = true },
        {'navarasu/onedark.nvim', opt = true},
        {'folke/tokyonight.nvim', opt = true },
        {'rebelot/kanagawa.nvim'}
    }

    use {'christianchiarulli/nvcode-color-schemes.vim', opt = true }
    use {'christoomey/vim-tmux-navigator'}
    use {'dataWraith/auto_mkdir'}
    use({
        "folke/persistence.nvim",
        event = "BufReadPre", -- this will only start session saving when an actual file was opened
        module = "persistence",
        config = function()
            require("persistence").setup()
        end,
    })
    use {'folke/trouble.nvim', config = [[require('kadobot.trouble')]], opt = true}
    use {'folke/which-key.nvim'}
    use {'ggandor/lightspeed.nvim', config = [[require('kadobot.lightspeed')]] }
    use {'glepnir/dashboard-nvim', config = [[require('kadobot.dashboard')]] }
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            {'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
            {'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },
            {'hrsh7th/cmp-calc', after = 'nvim-cmp' },
            'hrsh7th/cmp-nvim-lsp',
            'onsails/lspkind-nvim',
            {'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
            {'hrsh7th/cmp-path', after = 'nvim-cmp' },
            {'hrsh7th/vim-vsnip', after = 'nvim-cmp' },
            'windwp/nvim-autopairs'
        },
        config = [[require('kadobot.cmp')]]
    }
    use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons', config = [[require('kadobot.nvim-tree')]] }
    use {'kyazdani42/nvim-web-devicons' }
    use {
        'lukas-reineke/cmp-rg',
        requires = {
            'hrsh7th/nvim-cmp'
        }
    }
    use {'mbbill/undotree', opt = true, cmd = {'UndotreeShow'}}
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
        'noib3/nvim-cokeline',
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
            {'kyazdani42/nvim-web-devicons'},
            'tpope/vim-fugitive',
            'KadoBOT/nvim-spotify',
        },
        config = [[require('kadobot.lualine')]]
    }
    use {
        {
            'nvim-telescope/telescope.nvim',
            requires = {
                'telescope-frecency.nvim',
                'nvim-lua/plenary.nvim',
                'nvim-lua/popup.nvim',
                'nvim-telescope/telescope-symbols.nvim',
                'telescope-fzf-native.nvim',
                'telescope-fzf-writer.nvim',
            },
            wants = {
                'popup.nvim',
                'plenary.nvim',
                'telescope-frecency.nvim',
                'telescope-fzf-native.nvim',
            },
            config = [[require('kadobot.telescope')]],
            setup = [[require('kadobot.telescope_setup')]],
            cmd = 'Telescope',
            module = 'telescope'
        },
        {
            'nvim-telescope/telescope-fzf-writer.nvim',
            after = 'telescope.nvim',
        },
        {
            'nvim-telescope/telescope-frecency.nvim',
            after = 'telescope.nvim',
            requires = 'tami5/sql.nvim',
        },
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            run = 'make'
        }
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
    use {'psliwka/vim-smoothie'}
    use {'prettier/vim-prettier', opt = true, cmd = { 'Prettier' }, ft = {'ts', 'js'}}
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
    use {'windwp/nvim-autopairs', config = [[ require'kadobot.autopairs' ]]}
    use {'yggdroot/indentLine', setup = [[vim.g.indentLine_fileTypeExclude = {'dashboard'}]]}

    use {
        'KadoBOT/nvim-spotify',
        requires = 'nvim-telescope/telescope.nvim',
        config = [[require'kadobot.nvim-spotify']],
        run = 'make'
    }

    -- use {
    --     '~/Projects/nvim-spotify',
    --     requires = 'nvim-telescope/telescope.nvim',
    --     config = [[require'kadobot.nvim-spotify']],
    --     run = 'make'
    -- }

    if Packer_bootstrap then
        require('packer').sync()
    end
end)
