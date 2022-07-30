local nnoremap = require('keymap').nnoremap

vim.g.mapleader = " "

-- keybind to switch between folding methods so I can prefer syntx

nnoremap("<leader>u", ":UndotreeShow<CR>")

nnoremap("<leader>n", "<cmd>e #<cr>")
nnoremap("<C-w>L", "<cmd>vs #<cr>")

nnoremap("<leader>pv", "<cmd>Ex<cr>")

-- harpoon
-- nnoremap("<leader>p", function() require("harpoon.ui").toggle_quick_menu() end, silent)
nnoremap("<leader>p", function() require("harpoon.ui").toggle_quick_menu() end, silent)
-- nnoremap("<leader>w", function() require("harpoon.mark").toggle_file() end, silent)
-- nnoremap("<leader>p", "<cmd>Telescope harpoon marks<cr>")

nnoremap("<leader>q", function() require("harpoon.mark").add_file() end, silent)
nnoremap("<leader>a", function() require("harpoon.ui").nav_file(1) end, silent)
nnoremap("<leader>s", function() require("harpoon.ui").nav_file(2) end, silent)
nnoremap("<leader>d", function() require("harpoon.ui").nav_file(3) end, silent)
nnoremap("<leader>f", function() require("harpoon.ui").nav_file(4) end, silent)

nnoremap("<leader>ff", "<cmd>Telescope find_files<cr>")
nnoremap("<C-p>", "<cmd>Telescope find_files<cr>")
nnoremap("<leader>fg", "<cmd>Telescope live_grep<cr>")
nnoremap("<leader>fb", "<cmd>Telescope buffers<cr>")
nnoremap("<leader>.", "<cmd>e ~/.config/nvim<cr>")
nnoremap("q:", "<Nop>")

-- make this keep expandign
nnoremap("<C-e>", "<Plug>(expand_region_expand)")

require'lspconfig'.ember.setup{}

nnoremap("gd", function() vim.lsp.buf.definition() end)

require'lspconfig'.gopls.setup{}

require'lspconfig'.tsserver.setup{}
require'lspconfig'.eslint.setup{}