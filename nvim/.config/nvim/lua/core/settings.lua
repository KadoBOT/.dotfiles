local o = vim.opt
local g = vim.g

vim.cmd("colorscheme kanagawa")
o.autoindent = true
o.autoread = true
o.background = "dark"
o.backspace = "indent,eol,start"
o.backup = false
o.bomb = false
o.breakindent = true
g.bufhidden = true
o.clipboard = "unnamedplus"
o.cmdheight = 1
o.completeopt = "noselect"
o.confirm = true
o.conceallevel = 0
o.cursorcolumn = false
o.cursorline = false
o.cursorlineopt = "screenline"
o.display:append({ "lastline" })
g.did_load_filetypes = false
g.do_filetype_lua = true
o.encoding = "utf-8"
o.errorbells = false
o.expandtab = false
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
})
-- o.foldmethod = "expr"
-- o.foldexpr = "nvim_treesitter#foldexpr()"
o.formatoptions:remove({ "a", "t", "o", "2" })
o.formatoptions:append("cqrnj")
o.grepprg = [[rg --hidden --vimgrep --glob --follow --smart-case]]
o.history = 2000
o.hidden = true
o.hlsearch = true
o.ignorecase = true
o.inccommand = "split"
o.incsearch = true
o.laststatus = 3
o.lazyredraw = true
o.linebreak = true
o.list = false
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
o.magic = true
o.mat = 2
o.matchpairs:append({ "<:>,「:」,『:』,【:】,“:”,‘:’,《:》" })
o.modeline = false
o.mouse = "a"
o.nrformats:remove({ "octal" })
o.number = true
o.numberwidth = 4
o.path:append({"**"})
o.pumheight = 10
o.pumblend = 17
-- o.re = 1
o.redrawtime = 10000
o.relativenumber = false
o.ruler = false
o.scrolljump = 1
o.scrolloff = 4
o.shell = vim.env.SHELL
o.shiftround = true
o.shiftwidth = 4
o.shortmess:append("c")
o.showbreak = string.rep(" ", 4)
o.showcmd = true
o.showmatch = true
o.showmode = false
o.showtabline = 1
o.sidescroll = 1
o.sidescrolloff = 15
o.signcolumn = "yes"
o.smartcase = true
o.smartindent = true
o.smarttab = true
-- o.spell = true
-- o.spelllang = "en_us"
o.splitbelow = true
o.splitright = true
o.softtabstop = 4
o.startofline = false
o.syntax = "enable"
o.synmaxcol = 240
o.swapfile = false
o.tabstop = 4
o.termguicolors = true
o.textwidth = 120
g.tmux_navigator_no_mappings = 1
o.timeoutlen = 100
o.ttimeout = true
o.ttimeoutlen = 10
o.title = true
o.ttyfast = true
o.updatetime = 1000
o.virtualedit = ""
o.visualbell = true
o.wildignore:append({ "node_modules/**,.git/**" })
o.wildmenu = true
o.wildmode = "list"
o.wildoptions = "pum"
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

vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
]])

vim.api.nvim_set_hl(0, "WinSeparator", { bg = "None", fg = "#54546D" })
