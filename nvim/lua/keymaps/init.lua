local cnoreabbrev = function(command, instruction)
  vim.cmd("cnoreabbrev " .. command .. " " .. instruction)
end

-- open LazyGit
map("n", "<leader>lg", ":LazyGit<CR>")

-- open vista
map("n", "<leader>s", ":Vista nvim_lsp<CR>")

-- remove the L and Q commands
map("n", "L", "<Nop>")
map("n", "Q", "<Nop>")

-- resize window
map("n", "<C-H>", ":vertical resize -4<CR>")
map("n", "<C-L>", ":vertical resize +4><CR>")
map("n", "<C-J>", ":resize -4<CR>")
map("n", "<C-K>", ":resize +4<CR>")

-- resize window in terminal mode
map("t", "<C-H>", ":vertical resize -4<CR>")
map("t", "<C-L>", ":vertical resize +4><CR>")
map("t", "<C-J>", ":resize -4<CR>")
map("t", "<C-K>", ":resize +4<CR>")

-- start/end of line
map("i", "<C-b>", "<C-o>0")
map("i", "<C-z>", "<C-o>$")

-- commands with usual system register
map("n", "<leader>y", '"*y')
map("v", "<leader>y", '"*y')
map("n", "<leader>x", '"*x')
map("v", "<leader>x", '"*x')
map("n", "<leader>p", '"*p')
map("n", "<leader>p", '"*p')

-- select all
map("n", "<leader>a", "ggVG")

-- delete current buffer
map("n", "<leader>bd", ":bd<CR>")

-- terminal maps
map("t", "<leader><Esc>", "<C-\\><C-n>")
map("n", "<leader><CR>", ":Lspsaga toggle_floaterm<CR>")
map("t", "<leader><CR>", "<C-\\><C-n>:Lspsaga toggle_floaterm<CR>")

-- control c to toggle highlight for search
map(
  "n",
  "<C-C>",
  ":if (&hlsearch == 1) | set nohlsearch | else | set hlsearch | endif<cr>"
)

-- surrounding with parantheses
map("v", "<leader>'", "<esc>`>a'<esc>`<i'<esc>")
map("v", '<leader>"', '<esc>`>a"<esc>`<i"<esc>')
map("v", "<leader>(", "<esc>`>a)<esc>`<i(<esc>")
map("v", "<leader>[", "<esc>`>a]<esc>`<i[<esc>")
map("v", "<leader>{", "<esc>`>a}<esc>`<i{<esc>")
map("n", ";", ':lua require("fine-cmdline").open()<CR>', { noremap = true })

-- go through virtual lines instead of normal ones
map("n", "j", "gj")
map("n", "k", "gk")

-- Command aliases
-- For saving
cnoreabbrev("W", "w")
cnoreabbrev("wq", "w<bar>bd")
cnoreabbrev("Wq", "w<bar>bd")
cnoreabbrev("WQ", "w<bar>bd")
cnoreabbrev("Wqa", "wqa")
cnoreabbrev("wqa1", "wqa!")
-- For quitting
cnoreabbrev("Q", "q")
cnoreabbrev("qa1", "wqa!")
cnoreabbrev("Qa", "qa")
-- For buffers
cnoreabbrev("B", "b")

vim.cmd("source ~/.config/nvim/lua/keymaps/keymaps.vim")
