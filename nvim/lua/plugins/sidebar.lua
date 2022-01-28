require("sidebar-nvim").setup({
  open = true,
  initial_width = 40,
  sections = { "files", "datetime", "symbols", "git" },
})

map("n", "<leader>n", ":SidebarNvimFocus<CR>")
