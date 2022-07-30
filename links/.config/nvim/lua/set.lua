local opt = vim.opt
local g = vim.g

opt.colorcolumn = "80"
opt.clipboard = "unnamedplus"
opt.nu = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.hlsearch = search
opt.incsearch = true

opt.smartindent = true

opt.ignorecase = true
opt.smartcase = true
opt.wrap = false
opt.list = true
opt.foldlevel = 10
opt.listchars="tab:>-,space:.,eol:¬"
g.netrw_banner = 0

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

