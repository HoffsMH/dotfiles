vim.opt.colorcolumn = "80"
vim.api.nvim_command([[nnoremap <leader>pv <cmd>Ex<cr>]])
vim.opt.clipboard = "unnamedplus"
vim.opt.nu = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.hlsearch = search
vim.opt.incsearch = true
vim.opt.smartindent = true
vim.opt.wrap = false

vim.g.netrw_banner = 0

local nnoremap = require('keymap').nnoremap

vim.g.mapleader = " "

nnoremap("<leader>pv", "<cmd>Ex<cr>")
nnoremap("<leader>ff", "<cmd>Telescope find_files<cr>")
nnoremap("<leader>fg", "<cmd>Telescope live_grep<cr>")
nnoremap("<leader>fb", "<cmd>Telescope buffers<cr>")
nnoremap("q:", "<Nop>")



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
	    "go"
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


vim.api.nvim_command([[colorscheme gruvbox]])


vim.api.nvim_command([[map <C-e> <Plug>(expand_region_expand)]])





-- vim.api.nvim_command([[let mapleader = ","]])
-- vim.api.nvim_command([[nnoremap <SPACE> <Nop>]])


-- vim.api.nvim_command([[nnoremap <C-p> Telescope find_files<cr>]])

