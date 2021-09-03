vim.cmd("packadd formatter.nvim")
vim.cmd("packadd twilight.nvim")
vim.cmd("packadd vim-jsx-pretty")
vim.cmd("packadd vimwiki")
vim.cmd("packadd zen-mode.nvim")
vim.cmd("packadd twilight.nvim")
require("zen-mode").setup({})

vim.cmd("nnoremap <leader>z :ZenMode<CR>")
-- require("lsp_signature").setup()

local prettier = function()
  return {
    exe = "prettier",
    args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote" },
    stdin = true,
  }
end

require("formatter").setup({
  logging = false,
  filetype = {
    javascript = { prettier },
    javascriptreact = { prettier },
    typescript = { prettier },
    typescriptreact = { prettier },
    python = {
      function()
        return { exe = "black", args = { "-q", "-" }, stdin = true }
      end,
    },
    rust = {
      -- Rustfmt
      function()
        return {
          exe = "rustfmt",
          args = { "--emit=stdout" },
          stdin = true,
        }
      end,
    },
    lua = {
      function()
        return {
          exe = "stylua",
          args = { "--config-path", "/Users/sam/.config/nvim/stylua.toml", "-" },
          stdin = true,
        }
      end,
    },
  },
})

vim.api.nvim_exec(
  [[
    augroup FormatAutogroup
      autocmd!
      autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx,*.rs,*.py,*.lua FormatWrite
      au BufNewFile,BufRead *.prisma setfiletype graphql
    augroup END
  ]],
  true
)

require("lspconfig").prismals.setup({})
require("lspconfig").tailwindcss.setup({})
