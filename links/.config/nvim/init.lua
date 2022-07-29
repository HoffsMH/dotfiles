vim.opt.colorcolumn = "80"
vim.opt.clipboard = "unnamedplus"
vim.opt.nu = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.hlsearch = search
vim.opt.incsearch = true
vim.opt.smartindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = false
vim.opt.list = true
vim.opt.foldlevel = 5

vim.opt.listchars="tab:>-,space:.,eol:¬"

vim.g.netrw_banner = 0

local nnoremap = require('keymap').nnoremap

vim.g.mapleader = " "

-- keybind to switch between folding methods so I can prefer syntx

nnoremap("<leader>pv", "<cmd>Ex<cr>")
nnoremap("<leader>ff", "<cmd>Telescope find_files<cr>")
nnoremap("<leader>fg", "<cmd>Telescope live_grep<cr>")
nnoremap("<leader>fb", "<cmd>Telescope buffers<cr>")
nnoremap("<leader>.", "<cmd>e ~/.config/nvim<cr>")
nnoremap("q:", "<Nop>")

-- make this keep expandign
nnoremap("<C-e>", "<Plug>(expand_region_expand)")

-- to install packer
-- git clone --depth 1 https://github.com/wbthomason/packer.nvim\
--  ~/.local/share/nvim/site/pack/packer/start/packer.nvim

vim.api.nvim_command('packadd packer.nvim')

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use {'dracula/vim', as = 'dracula'}
  use { 'ellisonleao/gruvbox.nvim', as = 'gruvbox' }
  use { 'terryma/vim-expand-region', as = 'expand_region' }
  use 'andymass/vim-matchup'
  use 'rstacruz/vim-closer'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'terrortylor/nvim-comment'

end)

require('nvim_comment').setup({
  -- Linters prefer comment and line to have a space in between markers
  marker_padding = true,
  -- should comment out empty or whitespace only lines
  comment_empty = true,
  -- trim empty comment whitespace
  comment_empty_trim_whitespace = true,
  -- Should key mappings be created
  create_mappings = true,
  -- Normal mode mapping left hand side
  line_mapping = "gcc",
  -- Visual/Operator mapping left hand side
  operator_mapping = "gc",
  -- text object mapping, comment chunk,,
  comment_chunk_text_object = "ic",
  -- Hook function to call before commenting takes place
  hook = nil
})


require('nvim-treesitter.configs').setup {
    ensure_installed = {
	    "c",
	    "lua",
	    "javascript",
	    "go",
			"glimmer"
    },


  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
}

local vim = vim
local opt = vim.opt

opt.foldmethod = "indent"
opt.foldexpr = "nvim_treesitter#foldexpr()"

local parser_config = require'nvim-treesitter.parsers'.get_parser_configs()
parser_config.gotmpl = {
  install_info = {
    url = "https://github.com/ngalaiko/tree-sitter-go-template",
    files = {"src/parser.c"}
  },
  filetype = "gotmpl",
  used_by = {"gohtmltmpl", "gotexttmpl", "gotmpl", "yaml"}
}


vim.api.nvim_command([[colorscheme gruvbox]])







-- vim.api.nvim_command([[let mapleader = ","]])
-- vim.api.nvim_command([[nnoremap <SPACE> <Nop>]])


-- vim.api.nvim_command([[nnoremap <C-p> Telescope find_files<cr>]])

