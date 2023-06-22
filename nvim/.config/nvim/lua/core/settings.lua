_G.base = {}
base.default_colorscheme = "kanagawa"

local o = vim.opt
local g = vim.g

g.autoformat_enabled = false
g.autopairs_enabled = false
g.bufhidden = true
g.cmp_enabled = true
g.codelens_enabled = true
g.did_load_filetypes = false
g.dignostics_mode = 3
g.do_filetype_lua = true
g.highlighturl_enabled = true
g.icons_enabled = true
g.lsp_handlers_enabled = true
g.mapleader = " "
g.maplocaleader = ","
g.markdown_recommended_style = 0
g.tmux_navigator_no_mappings = 1
g.ui_notifications_enabled = true

o.autochdir = false
o.autoindent = true
o.autoread = true
o.autowrite = true
o.background = "dark"
o.backspace = "nostop,indent,eol,start"
o.backup = false
o.bomb = false
o.breakindent = true
o.clipboard = "unnamedplus"
o.cmdheight = 1
o.colorcolumn = "80"
o.completeopt = "menu,menuone,noselect"
o.conceallevel = 3
o.confirm = true
o.copyindent = true
o.cursorcolumn = false
o.cursorline = true
o.cursorlineopt = "screenline"
o.diffopt:append("linematch:60")
o.display:append({ "lastline" })
o.encoding = "utf-8"
o.errorbells = false
o.expandtab = true
o.fileencoding = "utf-8"
o.fileformats:append({ "mac" })
o.fillchars:append({
	horiz = "━",
	horizup = "┻",
	horizdown = "┳",
	vert = "┃",
	vertleft = "┨",
	vertright = "┣",
	verthoriz = "╋",
	eob = " ",
})
-- o.foldexpr = "nvim_treesitter#foldexpr()"
-- o.foldmethod = "expr"
o.foldcolumn = "1"
o.foldenable = true
o.foldlevel = 99
o.foldlevelstart = 99
o.formatoptions:append("jcroqlnt")
o.grepprg = "rg --vimgrep"
o.guicursor = "a:blinkon200"
o.hidden = true
o.history = 2000
o.hlsearch = true
o.ignorecase = true
o.inccommand = "nosplit"
o.incsearch = true
o.infercase = true
o.laststatus = 0
o.lazyredraw = false
o.linebreak = true
o.list = true
o.listchars = {
	tab = "▷ ",
	trail = "·",
	space = " ",
	eol = "↲",
	nbsp = "⦸",
	extends = "",
	precedes = "",
	conceal = "┊",
}
-- o.re = 1
-- o.spell = true
o.magic = true
o.mat = 2
o.matchpairs:append({ "<:>,「:」,『:』,【:】,“:”,‘:’,《:》" })
o.modeline = false
o.mouse = "a"
o.mousescroll = "ver:1,hor:0"
o.nrformats:remove({ "octal" })
o.number = true
o.numberwidth = 4
o.path:append({ "**" })
o.preserveindent = true
o.pumblend = 10
o.pumheight = 10
o.redrawtime = 10000
o.relativenumber = false
o.ruler = false
o.scrolljump = 1
o.scrolloff = 4
o.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
o.selection = "old"
o.shell = vim.env.SHELL
o.shiftround = true
o.shiftwidth = 2
o.shortmess:append({ c = true, I = true, W = true, C = true })
o.showbreak = string.rep(" ", 4)
o.showcmd = true
o.showmatch = true
o.showmode = false
o.showtabline = 2
o.sidescroll = 1
o.sidescrolloff = 15
o.signcolumn = "yes"
o.smartcase = true
o.smartindent = true
o.smarttab = true
o.smoothscroll = true
o.softtabstop = 2
o.spelllang = { "en" }
o.splitbelow = true
o.splitkeep = "screen"
o.splitright = true
o.startofline = false
o.swapfile = false
o.synmaxcol = 240
o.syntax = "enable"
o.tabstop = 4
o.termguicolors = true
o.textwidth = 120
o.timeoutlen = 300
o.title = true
o.ttimeout = true
o.ttimeoutlen = 10
o.ttyfast = true
o.undofile = true
o.undolevels = 10000
o.updatetime = 200
o.viewoptions:remove("curdir")
o.virtualedit = "block"
o.visualbell = true
o.wildignore:append({ "node_modules/**,.git/**" })
o.wildmenu = true
o.wildmode = "longest:full,full"
o.wildoptions = "pum"
o.winminwidth = 5
o.wrap = false
o.wrapmargin = 8
o.writebackup = false

local disabled_built_ins = {
	"2html_plugin",
	"getscript",
	"getscriptPlugin",
	"gzip",
	"logiPat",
	"netrw",
	"netrwFileHandlers",
	"netrwPlugin",
	"netrwSettings",
	"rrhelper",
	"spellfile_plugin",
	"tar",
	"tarPlugin",
	"vimball",
	"vimballPlugin",
	"zip",
	"zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
	g["loaded_" .. plugin] = 1
end

vim.cmd([[
    filetype plugin indent on
    augroup filetype_yaml
        autocmd!
        autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:>
    augroup END
]])

vim.api.nvim_set_hl(0, "WinSeparator", { bg = "None", fg = "#16161D" })
