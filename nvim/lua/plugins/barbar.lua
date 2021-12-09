vim.g.bufferline = { auto_hide = false }
-- Goto buffer in position...
map("n", "<Leader>1", ":BufferGoto 1<CR>")
map("n", "<Leader>2", ":BufferGoto 2<CR>")
map("n", "<Leader>3", ":BufferGoto 3<CR>")
map("n", "<Leader>4", ":BufferGoto 4<CR>")
map("n", "<Leader>5", ":BufferGoto 5<CR>")
map("n", "<Leader>6", ":BufferGoto 6<CR>")
map("n", "<Leader>7", ":BufferGoto 7<CR>")
map("n", "<Leader>8", ":BufferGoto 8<CR>")
map("n", "<Leader>9", ":BufferGoto 9<CR>")
map("n", "<Leader>0", ":BufferLast<CR>")
-- Close buffer
map("n", "<A-c>", ":BufferClose<CR>")
-- Wipeout buffer
--                 :BufferWipeout<CR>
-- Close commands
--                 :BufferCloseAllButCurrent<CR>
--                 :BufferCloseBuffersLeft<CR>
--                 :BufferCloseBuffersRight<CR>
-- Magic buffer-picking mode
map("n", "<C-p>", ":BufferPick<CR>")
-- Sort automatically by...
map("n", "<Space>bb", ":BufferOrderByBufferNumber<CR>")
map("n", "<Space>bd", ":BufferOrderByDirectory<CR>")
map("n", "<Space>bl", ":BufferOrderByLanguage<CR>")
