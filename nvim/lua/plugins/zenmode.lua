-- folke/zen-mode.nvim
require("zen-mode").setup({
  window = { width = 0.70 },
})
map("n", "<leader>z", ":ZenMode<CR>")

map("n", "<s-l>", ":bnext<CR>")
map("n", "<s-h>", ":bprev<CR>")

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("n", "Y", "y$")
