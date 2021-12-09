-- glepnir/lspsaga.nvim
require("lspsaga").init_lsp_saga({})

map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "gh", ":Lspsaga lsp_finder <cr>")
map(
  "n",
  "<space>ca",
  '<cmd>lua require("telescope.builtin").lsp_code_actions()<cr>'
)
map(
  "v",
  "<leader>ca",
  '<cmd>lua require("telescope.builtin").lsp_range_code_actions()<cr>'
)
map("n", "K", ":Lspsaga hover_doc<CR>")
map("n", "gs", ":Lspsaga signature_help<CR>")
map("n", "gr", ":Lspsaga rename<CR>")
map("n", "<space>gd", ":Lspsaga preview_definition<CR>")
map("n", "<Leader>cd", ":Lspsaga show_line_diagnostics<CR>")
map(
  "n",
  "<space>cc",
  ':lua require("telescope.builtin").lsp_document_diagnostics()<CR>'
)
map("n", "[d", ":Lspsaga diagnostic_jump_prev<CR>")
map("n", "]d", ":Lspsaga diagnostic_jump_next<CR>")
