local g = vim.g

g.mapleader = " "

require("globals")
require("utils")
require("plugins.barbar")
require("options")
require("plugins")

-- goolord/alpha-nvim
require("alpha").setup(require("alpha.themes.startify").opts)

-- lewis6991/gitsigns.nvim
require("gitsigns").setup({})

-- neovim/nvim-lspconfig
require("lspconf")

-- vim.cmd("hi Normal guibg=NONE ctermbg=NONE")

require("keymaps")
require("autocmds")
require("colors")
