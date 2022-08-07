local opt = vim.opt
local g = vim.g

opt.colorcolumn = "80"
opt.clipboard = "unnamedplus"
opt.nu = true
opt.tabstop = 2
opt.softtabstop = 2
opt.expandtab = true
opt.shiftwidth = 2
opt.hlsearch = false
opt.incsearch = true
opt.autoread = true

opt.smartindent = true

opt.ignorecase = true
opt.smartcase = true
opt.wrap = false
opt.list = true
opt.foldlevel = 10
opt.listchars="tab:>-,space:.,eol:¬"
g.netrw_banner = 0
g.lf_map_keys = 0
g.telescope_map_keys = 0


opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

