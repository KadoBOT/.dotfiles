-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/ricardoambrogi/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/ricardoambrogi/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/ricardoambrogi/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/ricardoambrogi/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/ricardoambrogi/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["FixCursorHold.nvim"] = {
    config = { "\27LJ\2\n7\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1d\0=\1\2\0K\0\1\0\26cursorhold_updatetime\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/opt/FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim"
  },
  ["aerial.nvim"] = {
    config = { "require('kadobot.aerial')" },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/aerial.nvim",
    url = "https://github.com/stevearc/aerial.nvim"
  },
  ["alpha-nvim"] = {
    config = { "require('kadobot.alpha')" },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["bufferline.nvim"] = {
    config = { "require('kadobot.bufferline')" },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-document-symbol"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-document-symbol",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-plugins"] = {
    config = { "\27LJ\2\n^\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\nfiles\1\0\0\1\2\0\0\16plugins.lua\nsetup\16cmp-plugins\frequire\0" },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/cmp-plugins",
    url = "/Users/ricardoambrogi/Projects/cmp-plugins"
  },
  ["cmp-treesitter"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/cmp-treesitter",
    url = "https://github.com/ray-x/cmp-treesitter"
  },
  ["edgedb-vim"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/edgedb-vim",
    url = "https://github.com/edgedb/edgedb-vim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/editorconfig-vim",
    url = "https://github.com/editorconfig/editorconfig-vim"
  },
  ["filetype.nvim"] = {
    config = { "\27LJ\2\nÇ\1\0\0\5\0\v\0\0156\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\3\0'\2\4\0B\0\2\0029\0\5\0005\2\t\0005\3\a\0005\4\6\0=\4\b\3=\3\n\2B\0\2\1K\0\1\0\14overrides\1\0\0\15extensions\1\0\0\1\0\5\bcql\bsql\nproto\nproto\tesdl\vedgeql\tpuml\rplantuml\6v\nvlang\nsetup\rfiletype\frequire\23did_load_filetypes\6g\bvim\0" },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/filetype.nvim",
    url = "https://github.com/nathom/filetype.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "require('kadobot.gitsigns')" },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["hlargs.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vhlargs\frequire\0" },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/hlargs.nvim",
    url = "https://github.com/m-demare/hlargs.nvim"
  },
  ["hydra.nvim"] = {
    config = { "require('kadobot.hydra')" },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/hydra.nvim",
    url = "https://github.com/anuvyklack/hydra.nvim"
  },
  ["impatient.nvim"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\19enable_profile\14impatient\frequire\0" },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["inc-rename.nvim"] = {
    config = { "\27LJ\2\nf\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\rhl_group\15Substitute\rcmd_name\14IncRename\nsetup\15inc_rename\frequire\0" },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/inc-rename.nvim",
    url = "https://github.com/smjonas/inc-rename.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "require('kadobot.indent-blankline')" },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["indent-o-matic"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19indent-o-matic\frequire\0" },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/indent-o-matic",
    url = "https://github.com/Darazaki/indent-o-matic"
  },
  ["kanagawa.nvim"] = {
    config = { "require('kadobot.kanagawa')" },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/kanagawa.nvim",
    url = "https://github.com/rebelot/kanagawa.nvim"
  },
  ["keymap-layer.nvim"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/keymap-layer.nvim",
    url = "https://github.com/anuvyklack/keymap-layer.nvim"
  },
  ["lightspeed.nvim"] = {
    config = { "require('kadobot.lightspeed')" },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/lightspeed.nvim",
    url = "https://github.com/ggandor/lightspeed.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "require('kadobot.lspsaga')" },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/lua-dev.nvim",
    url = "https://github.com/folke/lua-dev.nvim"
  },
  ["lualine.nvim"] = {
    config = { "require('kadobot.lualine')" },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["modes.nvim"] = {
    config = { "\27LJ\2\n¼\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\21ignore_filetypes\1\3\0\0\rneo-tree\20TelescopePrompt\vcolors\1\0\0\1\0\4\tcopy\f#dca561\vinsert\f#a3d4d5\vvisual\f#957fb8\vdelete\f#c34043\nsetup\nmodes\frequire\0" },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/modes.nvim",
    url = "https://github.com/mvllow/modes.nvim"
  },
  ["neo-tree.nvim"] = {
    config = { "require('kadobot.neo-tree')" },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["null-ls.nvim"] = {
    config = { "require('kadobot.null-ls')" },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "require('kadobot.autopairs')" },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "tabout.nvim" },
    config = { "require('kadobot.cmp')" },
    loaded = true,
    only_config = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    config = { "require('kadobot.dap')" },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    config = { "\27LJ\2\nš\1\0\0\a\0\t\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0005\2\a\0005\3\6\0006\4\0\0'\6\1\0B\4\2\0029\4\5\4>\4\1\3=\3\b\2B\0\2\1K\0\1\0\v<C-D>h\1\0\0\1\3\0\0\0\14Toggle UI\vtoggle\rregister\14which-key\nsetup\ndapui\frequire\0" },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    config = { "\27LJ\2\nC\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\26nvim-dap-virtual-text\frequire\0" },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text",
    url = "https://github.com/theHamsta/nvim-dap-virtual-text"
  },
  ["nvim-lspconfig"] = {
    config = { "require('kadobot.lsp')" },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "require('kadobot.treesitter')" },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["paint.nvim"] = {
    config = { "\27LJ\2\n \1\0\0\6\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0004\3\3\0005\4\4\0005\5\3\0=\5\5\4>\4\1\3=\3\a\2B\0\2\1K\0\1\0\15highlights\1\0\0\vfilter\1\0\2\ahl\fKeyword\fpattern\27^%/%/%s*(%w+)%s*[^\n]%w\1\0\1\rfiletype\ago\nsetup\npaint\frequire\0" },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/paint.nvim",
    url = "https://github.com/folke/paint.nvim"
  },
  ["persistence.nvim"] = {
    config = { "require('kadobot.persistence')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/opt/persistence.nvim",
    url = "https://github.com/folke/persistence.nvim"
  },
  ["plantuml-syntax"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/plantuml-syntax",
    url = "https://github.com/aklt/plantuml-syntax"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["reach.nvim"] = {
    config = { "require('kadobot.reach')" },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/reach.nvim",
    url = "https://github.com/toppair/reach.nvim"
  },
  ["smart-splits.nvim"] = {
    config = { "require('kadobot.smart-splits')" },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/smart-splits.nvim",
    url = "https://github.com/mrjones2014/smart-splits.nvim"
  },
  ["sqls.nvim"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/sqls.nvim",
    url = "https://github.com/nanotee/sqls.nvim"
  },
  ["tabout.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vtabout\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/opt/tabout.nvim",
    url = "https://github.com/abecodes/tabout.nvim",
    wants = { "nvim-treesitter" }
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/targets.vim",
    url = "https://github.com/wellle/targets.vim"
  },
  ["telescope-dap.nvim"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/telescope-dap.nvim",
    url = "https://github.com/nvim-telescope/telescope-dap.nvim"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-fzf-writer.nvim"] = {
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/opt/telescope-fzf-writer.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-writer.nvim"
  },
  ["telescope-project.nvim"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/telescope-project.nvim",
    url = "https://github.com/nvim-telescope/telescope-project.nvim"
  },
  ["telescope-symbols.nvim"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/telescope-symbols.nvim",
    url = "https://github.com/nvim-telescope/telescope-symbols.nvim"
  },
  ["telescope.nvim"] = {
    after = { "telescope-fzf-writer.nvim" },
    commands = { "Telescope" },
    config = { "require('kadobot.telescope')" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim",
    wants = { "plenary.nvim", "telescope-fzf-native.nvim" }
  },
  ["template-string.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20template-string\frequire\0" },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/template-string.nvim",
    url = "https://github.com/axelvc/template-string.nvim"
  },
  ["trouble.nvim"] = {
    config = { "require('kadobot.trouble')" },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["twilight.nvim"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/twilight.nvim",
    url = "https://github.com/folke/twilight.nvim"
  },
  ["typescript.nvim"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/typescript.nvim",
    url = "https://github.com/jose-elias-alvarez/typescript.nvim"
  },
  undotree = {
    commands = { "UndotreeShow" },
    config = { "\27LJ\2\ni\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\1\tdesc\rUndoTree\22:UndotreeShow<CR>\14<Space>tu\6n\bset\vkeymap\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/opt/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-astro"] = {
    config = { "\27LJ\2\n9\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\venable\21astro_typescript\6g\bvim\0" },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/vim-astro",
    url = "https://github.com/wuelnerdotexe/vim-astro"
  },
  ["vim-bufkill"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/vim-bufkill",
    url = "https://github.com/qpkorr/vim-bufkill"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/vim-eunuch",
    url = "https://github.com/tpope/vim-eunuch"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  ["virt-column.nvim"] = {
    config = { "\27LJ\2\na\0\0\3\0\a\0\n6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0B\0\1\1K\0\1\0\nsetup\16virt-column\frequire\b121\16colorcolumn\bopt\bvim\0" },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/virt-column.nvim",
    url = "https://github.com/lukas-reineke/virt-column.nvim"
  },
  ["which-key.nvim"] = {
    config = { "require('kadobot.which-key')" },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["zen-mode.nvim"] = {
    config = { "\27LJ\2\nj\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\fplugins\1\0\0\nkitty\1\0\0\1\0\1\fenabled\2\nsetup\rzen-mode\frequire\0" },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^persistence"] = "persistence.nvim",
  ["^telescope"] = "telescope.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Setup for: telescope.nvim
time([[Setup for telescope.nvim]], true)
require('kadobot.telescope_setup')
time([[Setup for telescope.nvim]], false)
-- Setup for: markdown-preview.nvim
time([[Setup for markdown-preview.nvim]], true)
try_loadstring("\27LJ\2\n¡\1\0\0\3\0\b\0\v6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\6\0005\2\5\0=\2\a\1=\1\4\0K\0\1\0\buml\1\0\0\1\0\2\16imageFormat\bsvg\vserver\26http://localhost:8888\25mkdp_preview_options\1\2\0\0\rmarkdown\19mkdp_filetypes\6g\bvim\0", "setup", "markdown-preview.nvim")
time([[Setup for markdown-preview.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require('kadobot.treesitter')
time([[Config for nvim-treesitter]], false)
-- Config for: hydra.nvim
time([[Config for hydra.nvim]], true)
require('kadobot.hydra')
time([[Config for hydra.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: impatient.nvim
time([[Config for impatient.nvim]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\19enable_profile\14impatient\frequire\0", "config", "impatient.nvim")
time([[Config for impatient.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
require('kadobot.lsp')
time([[Config for nvim-lspconfig]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
require('kadobot.trouble')
time([[Config for trouble.nvim]], false)
-- Config for: lightspeed.nvim
time([[Config for lightspeed.nvim]], true)
require('kadobot.lightspeed')
time([[Config for lightspeed.nvim]], false)
-- Config for: aerial.nvim
time([[Config for aerial.nvim]], true)
require('kadobot.aerial')
time([[Config for aerial.nvim]], false)
-- Config for: cmp-plugins
time([[Config for cmp-plugins]], true)
try_loadstring("\27LJ\2\n^\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\nfiles\1\0\0\1\2\0\0\16plugins.lua\nsetup\16cmp-plugins\frequire\0", "config", "cmp-plugins")
time([[Config for cmp-plugins]], false)
-- Config for: indent-o-matic
time([[Config for indent-o-matic]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19indent-o-matic\frequire\0", "config", "indent-o-matic")
time([[Config for indent-o-matic]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
require('kadobot.lspsaga')
time([[Config for lspsaga.nvim]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
require('kadobot.bufferline')
time([[Config for bufferline.nvim]], false)
-- Config for: vim-astro
time([[Config for vim-astro]], true)
try_loadstring("\27LJ\2\n9\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\venable\21astro_typescript\6g\bvim\0", "config", "vim-astro")
time([[Config for vim-astro]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
require('kadobot.lualine')
time([[Config for lualine.nvim]], false)
-- Config for: reach.nvim
time([[Config for reach.nvim]], true)
require('kadobot.reach')
time([[Config for reach.nvim]], false)
-- Config for: modes.nvim
time([[Config for modes.nvim]], true)
try_loadstring("\27LJ\2\n¼\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\21ignore_filetypes\1\3\0\0\rneo-tree\20TelescopePrompt\vcolors\1\0\0\1\0\4\tcopy\f#dca561\vinsert\f#a3d4d5\vvisual\f#957fb8\vdelete\f#c34043\nsetup\nmodes\frequire\0", "config", "modes.nvim")
time([[Config for modes.nvim]], false)
-- Config for: smart-splits.nvim
time([[Config for smart-splits.nvim]], true)
require('kadobot.smart-splits')
time([[Config for smart-splits.nvim]], false)
-- Config for: neo-tree.nvim
time([[Config for neo-tree.nvim]], true)
require('kadobot.neo-tree')
time([[Config for neo-tree.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
require('kadobot.which-key')
time([[Config for which-key.nvim]], false)
-- Config for: zen-mode.nvim
time([[Config for zen-mode.nvim]], true)
try_loadstring("\27LJ\2\nj\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\fplugins\1\0\0\nkitty\1\0\0\1\0\1\fenabled\2\nsetup\rzen-mode\frequire\0", "config", "zen-mode.nvim")
time([[Config for zen-mode.nvim]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
require('kadobot.null-ls')
time([[Config for null-ls.nvim]], false)
-- Config for: nvim-dap-virtual-text
time([[Config for nvim-dap-virtual-text]], true)
try_loadstring("\27LJ\2\nC\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\26nvim-dap-virtual-text\frequire\0", "config", "nvim-dap-virtual-text")
time([[Config for nvim-dap-virtual-text]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
require('kadobot.autopairs')
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
require('kadobot.cmp')
time([[Config for nvim-cmp]], false)
-- Config for: paint.nvim
time([[Config for paint.nvim]], true)
try_loadstring("\27LJ\2\n \1\0\0\6\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0004\3\3\0005\4\4\0005\5\3\0=\5\5\4>\4\1\3=\3\a\2B\0\2\1K\0\1\0\15highlights\1\0\0\vfilter\1\0\2\ahl\fKeyword\fpattern\27^%/%/%s*(%w+)%s*[^\n]%w\1\0\1\rfiletype\ago\nsetup\npaint\frequire\0", "config", "paint.nvim")
time([[Config for paint.nvim]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
require('kadobot.alpha')
time([[Config for alpha-nvim]], false)
-- Config for: virt-column.nvim
time([[Config for virt-column.nvim]], true)
try_loadstring("\27LJ\2\na\0\0\3\0\a\0\n6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0B\0\1\1K\0\1\0\nsetup\16virt-column\frequire\b121\16colorcolumn\bopt\bvim\0", "config", "virt-column.nvim")
time([[Config for virt-column.nvim]], false)
-- Config for: inc-rename.nvim
time([[Config for inc-rename.nvim]], true)
try_loadstring("\27LJ\2\nf\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\rhl_group\15Substitute\rcmd_name\14IncRename\nsetup\15inc_rename\frequire\0", "config", "inc-rename.nvim")
time([[Config for inc-rename.nvim]], false)
-- Config for: filetype.nvim
time([[Config for filetype.nvim]], true)
try_loadstring("\27LJ\2\nÇ\1\0\0\5\0\v\0\0156\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\3\0'\2\4\0B\0\2\0029\0\5\0005\2\t\0005\3\a\0005\4\6\0=\4\b\3=\3\n\2B\0\2\1K\0\1\0\14overrides\1\0\0\15extensions\1\0\0\1\0\5\bcql\bsql\nproto\nproto\tesdl\vedgeql\tpuml\rplantuml\6v\nvlang\nsetup\rfiletype\frequire\23did_load_filetypes\6g\bvim\0", "config", "filetype.nvim")
time([[Config for filetype.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: template-string.nvim
time([[Config for template-string.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20template-string\frequire\0", "config", "template-string.nvim")
time([[Config for template-string.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
require('kadobot.indent-blankline')
time([[Config for indent-blankline.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
require('kadobot.gitsigns')
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
require('kadobot.dap')
time([[Config for nvim-dap]], false)
-- Config for: kanagawa.nvim
time([[Config for kanagawa.nvim]], true)
require('kadobot.kanagawa')
time([[Config for kanagawa.nvim]], false)
-- Config for: hlargs.nvim
time([[Config for hlargs.nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vhlargs\frequire\0", "config", "hlargs.nvim")
time([[Config for hlargs.nvim]], false)
-- Config for: nvim-dap-ui
time([[Config for nvim-dap-ui]], true)
try_loadstring("\27LJ\2\nš\1\0\0\a\0\t\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0005\2\a\0005\3\6\0006\4\0\0'\6\1\0B\4\2\0029\4\5\4>\4\1\3=\3\b\2B\0\2\1K\0\1\0\v<C-D>h\1\0\0\1\3\0\0\0\14Toggle UI\vtoggle\rregister\14which-key\nsetup\ndapui\frequire\0", "config", "nvim-dap-ui")
time([[Config for nvim-dap-ui]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd tabout.nvim ]]

-- Config for: tabout.nvim
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vtabout\frequire\0", "config", "tabout.nvim")

time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'Telescope', function(cmdargs)
          require('packer.load')({'telescope.nvim'}, { cmd = 'Telescope', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'telescope.nvim'}, { cmd = 'Telescope' }, _G.packer_plugins)
          return vim.fn.getcompletion('Telescope ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'UndotreeShow', function(cmdargs)
          require('packer.load')({'undotree'}, { cmd = 'UndotreeShow', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'undotree'}, { cmd = 'UndotreeShow' }, _G.packer_plugins)
          return vim.fn.getcompletion('UndotreeShow ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufRead * ++once lua require("packer.load")({'FixCursorHold.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'persistence.nvim'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
