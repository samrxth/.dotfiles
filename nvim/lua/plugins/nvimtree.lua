-- kyazdani42/nvim-tree.lua
require("nvim-tree").setup({
  disable_netrw = false,
  hijack_netrw = false,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  view = {
    width = 45,
    side = "left",
  },
})

map("n", "<leader>n", ":NvimTreeToggle<CR>")
