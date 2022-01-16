-- glepnir/lspsaga.nvim
require("lspsaga").init_lsp_saga({})

map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "gh", ":Lspsaga lsp_finder <cr>")
map("n", "<leader>ca", ":Lspsaga code_action <CR>")
map("n", "K", ":Lspsaga hover_doc<CR>")
map("n", "gs", ":Lspsaga signature_help<CR>")
map("n", "gr", ":Lspsaga rename<CR>")
map("n", "<space>gd", ":Lspsaga preview_definition<CR>")
map("n", "<Leader>cc", ":Lspsaga show_line_diagnostics<CR>")
map("n", "[d", ":Lspsaga diagnostic_jump_prev<CR>")
map("n", "]d", ":Lspsaga diagnostic_jump_next<CR>")
