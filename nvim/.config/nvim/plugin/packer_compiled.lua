-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

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

  _G._packer = _G._packer or {}
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
  auto_mkdir = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/auto_mkdir",
    url = "https://github.com/dataWraith/auto_mkdir"
  },
  ["cmp-buffer"] = {
    after_files = { "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-calc"] = {
    after_files = { "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/opt/cmp-calc/after/plugin/cmp_calc.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/opt/cmp-calc",
    url = "https://github.com/hrsh7th/cmp-calc"
  },
  ["cmp-cmdline"] = {
    after_files = { "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/opt/cmp-cmdline/after/plugin/cmp_cmdline.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/opt/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    after_files = { "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    after_files = { "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-rg"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/cmp-rg",
    url = "https://github.com/lukas-reineke/cmp-rg"
  },
  ["dashboard-nvim"] = {
    config = { "require('kadobot.dashboard')" },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/dashboard-nvim",
    url = "https://github.com/glepnir/dashboard-nvim"
  },
  ["doom-one.nvim"] = {
    config = { "require('kadobot.doom-one')" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/opt/doom-one.nvim",
    url = "https://github.com/nTBBloodbath/doom-one.nvim"
  },
  ["filetype.nvim"] = {
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
  ["impatient.nvim"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\19enable_profile\14impatient\frequire\0" },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  indentLine = {
    after_files = { "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/opt/indentLine/after/plugin/indentLine.vim" },
    loaded = true,
    needs_bufread = false,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/opt/indentLine",
    url = "https://github.com/yggdroot/indentLine"
  },
  ["kanagawa.nvim"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/kanagawa.nvim",
    url = "https://github.com/rebelot/kanagawa.nvim"
  },
  ["lightspeed.nvim"] = {
    config = { "require('kadobot.lightspeed')" },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/lightspeed.nvim",
    url = "https://github.com/ggandor/lightspeed.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/tami5/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { "require('kadobot.lualine')" },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  neogit = {
    commands = { "Neogit" },
    config = { "require('kadobot.neogit')" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/opt/neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  ["nord-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/opt/nord-vim",
    url = "https://github.com/arcticicestudio/nord-vim"
  },
  ["nvcode-color-schemes.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/opt/nvcode-color-schemes.vim",
    url = "https://github.com/christianchiarulli/nvcode-color-schemes.vim"
  },
  ["nvim-autopairs"] = {
    config = { " require'kadobot.autopairs' " },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "cmp-buffer", "cmp-path", "cmp-calc", "cmp-nvim-lua", "cmp-cmdline", "vim-vsnip" },
    loaded = true,
    only_config = true
  },
  ["nvim-cokeline"] = {
    config = { "require('kadobot.cokeline')" },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/nvim-cokeline",
    url = "https://github.com/noib3/nvim-cokeline"
  },
  ["nvim-colorizer.lua"] = {
    config = { "require('colorizer').setup {'css', 'javascript', 'vim', 'html', 'typescript'}" },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    config = { "require('kadobot.lsp')" },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-spotify"] = {
    config = { "require'kadobot.nvim-spotify'" },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/nvim-spotify",
    url = "https://github.com/KadoBOT/nvim-spotify"
  },
  ["nvim-tree.lua"] = {
    config = { "require('kadobot.nvim-tree')" },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "require('kadobot.treesitter')" },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-refactor",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-refactor"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["onedark.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/opt/onedark.nvim",
    url = "https://github.com/navarasu/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["persistence.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16persistence\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/opt/persistence.nvim",
    url = "https://github.com/folke/persistence.nvim"
  },
  playground = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/opt/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["sql.nvim"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/sql.nvim",
    url = "https://github.com/tami5/sql.nvim"
  },
  ["telescope-frecency.nvim"] = {
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/opt/telescope-frecency.nvim",
    url = "https://github.com/nvim-telescope/telescope-frecency.nvim"
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
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/opt/telescope-project.nvim",
    url = "https://github.com/nvim-telescope/telescope-project.nvim"
  },
  ["telescope-symbols.nvim"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/telescope-symbols.nvim",
    url = "https://github.com/nvim-telescope/telescope-symbols.nvim"
  },
  ["telescope.nvim"] = {
    after = { "telescope-frecency.nvim", "telescope-fzf-writer.nvim", "telescope-project.nvim" },
    commands = { "Telescope" },
    config = { "require('kadobot.telescope')" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim",
    wants = { "popup.nvim", "plenary.nvim", "telescope-frecency.nvim", "telescope-project.nvim", "telescope-fzf-native.nvim" }
  },
  ["tokyonight.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/opt/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    config = { "require('kadobot.trouble')" },
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  undotree = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-bbye"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/vim-bbye",
    url = "https://github.com/moll/vim-bbye"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/vim-eunuch",
    url = "https://github.com/tpope/vim-eunuch"
  },
  ["vim-prettier"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/vim-prettier",
    url = "https://github.com/prettier/vim-prettier"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator",
    url = "https://github.com/christoomey/vim-tmux-navigator"
  },
  ["vim-vsnip"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/opt/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/Users/ricardoambrogi/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
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

-- Setup for: indentLine
time([[Setup for indentLine]], true)
vim.g.indentLine_fileTypeExclude = {'dashboard'}
time([[Setup for indentLine]], false)
time([[packadd for indentLine]], true)
vim.cmd [[packadd indentLine]]
time([[packadd for indentLine]], false)
-- Setup for: telescope.nvim
time([[Setup for telescope.nvim]], true)
require('kadobot.telescope_setup')
time([[Setup for telescope.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
require('colorizer').setup {'css', 'javascript', 'vim', 'html', 'typescript'}
time([[Config for nvim-colorizer.lua]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
require('kadobot.gitsigns')
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
require('kadobot.lsp')
time([[Config for nvim-lspconfig]], false)
-- Config for: impatient.nvim
time([[Config for impatient.nvim]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\19enable_profile\14impatient\frequire\0", "config", "impatient.nvim")
time([[Config for impatient.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
require('kadobot.trouble')
time([[Config for trouble.nvim]], false)
-- Config for: nvim-spotify
time([[Config for nvim-spotify]], true)
require'kadobot.nvim-spotify'
time([[Config for nvim-spotify]], false)
-- Config for: dashboard-nvim
time([[Config for dashboard-nvim]], true)
require('kadobot.dashboard')
time([[Config for dashboard-nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
 require'kadobot.autopairs' 
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
require('kadobot.nvim-tree')
time([[Config for nvim-tree.lua]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
require('kadobot.lualine')
time([[Config for lualine.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
require('kadobot.cmp')
time([[Config for nvim-cmp]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require('kadobot.treesitter')
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-cokeline
time([[Config for nvim-cokeline]], true)
require('kadobot.cokeline')
time([[Config for nvim-cokeline]], false)
-- Config for: lightspeed.nvim
time([[Config for lightspeed.nvim]], true)
require('kadobot.lightspeed')
time([[Config for lightspeed.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd cmp-cmdline ]]
vim.cmd [[ packadd vim-vsnip ]]
vim.cmd [[ packadd cmp-calc ]]
vim.cmd [[ packadd cmp-path ]]
vim.cmd [[ packadd cmp-nvim-lua ]]
vim.cmd [[ packadd cmp-buffer ]]
time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Neogit lua require("packer.load")({'neogit'}, { cmd = "Neogit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'persistence.nvim'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
