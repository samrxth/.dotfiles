-- load all plugins
require "pluginList"

local g = vim.g

g.mapleader = " "
g.auto_save = false

require "statusline"
require "top-bufferline"
require "coc-config"
require "dashboard-conf"

require "telescope-conf"

vim.cmd("source ~/.config/nvim/mappings.vim")
vim.cmd("source ~/.config/nvim/general.vim")
vim.cmd("colorscheme nord")
