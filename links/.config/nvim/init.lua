-- to install packer
-- git clone --depth 1 https://github.com/wbthomason/packer.nvim\
--  ~/.local/share/nvim/site/pack/packer/start/packer.nvim

vim.api.nvim_command('packadd packer.nvim')

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'ellisonleao/gruvbox.nvim', as = 'gruvbox' }
  use { 'terryma/vim-expand-region', as = 'expand_region' }
  use 'andymass/vim-matchup'
  use 'rstacruz/vim-closer'
  use 'nvim-telescope/telescope.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'terrortylor/nvim-comment'
  use 'mbbill/undotree'
  use 'ThePrimeagen/harpoon'
  use 'neovim/nvim-lspconfig'
  use 'voldikss/vim-floaterm'
  use 'ptzz/lf.vim'
end)

-- Thumb up for elegance and simplicity! Worked like a breeze! [One needs to put this in his _vimrc.] – 
-- llinfeng
--  Aug 22, 2016 at 19:12
-- This doesn't literally solve the problem posed, but it seems a really good substitute. Can this be marked as the solution? – 
-- philo vivero
--  Sep 28, 2019 at 2:07
-- autocmd TextChanged,TextChangedI * silent write works for any buffer. – 
-- ayorgo
--  Jun 22, 2020 at 21:45
-- this breaks editing of files opened in read-only mode 

vim.api.nvim_command([[autocmd TextChanged,TextChangedI <buffer> silent write]])
vim.api.nvim_command([[autocmd TextChanged,TextChangedI *.rb silent write]])
vim.api.nvim_command([[autocmd TextChanged,TextChangedI *.hbs silent write]])
vim.api.nvim_command([[autocmd TextChanged,TextChangedI *.lua silent write]])

require('set')
require('binds')

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
      "glimmer",
      "ruby"
    },

    indent = {
      enable = true
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
--
--
-- local parser_config = require'nvim-treesitter.parsers'.get_parser_configs()
-- parser_config.gotmpl = {
--   install_info = {
--     url = "https://github.com/ngalaiko/tree-sitter-go-template",
--     files = {"src/parser.c"}
--   },
--   filetype = "gotmpl",
--   used_by = {"gohtmltmpl", "gotexttmpl", "gotmpl", "yaml"}
-- }
--
--
--
vim.api.nvim_command([[colorscheme gruvbox]])


require('telescope').setup{
  defaults = {
    livegrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--ignore-vcs',
      '-u' -- thats the new thing
    },
  }
}


