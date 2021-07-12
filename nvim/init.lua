-- load all plugins
require "pluginList"

local g = vim.g

g.mapleader = " "
g.auto_save = false
require('nord').set()

require "statusline"
require "top-bufferline"
require "coc-config"

vim.cmd("source ~/.config/nvim/mappings.vim")
vim.cmd("source ~/.config/nvim/general.vim")
