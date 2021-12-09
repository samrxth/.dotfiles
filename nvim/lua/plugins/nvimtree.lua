-- kyazdani42/nvim-tree.lua
require("nvim-tree").setup({
  disable_netrw = false,
  hijack_netrw = false,
  ignore_ft_on_setup = {},
  update_to_buf_dir = {
    enable = true,
    auto_open = true,
  },
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  view = {
    width = 45,
    side = "left",
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {},
    },
  },
})

map("n", "<leader>n", ":NvimTreeToggle<CR>")
