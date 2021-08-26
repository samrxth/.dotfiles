vim.cmd("packadd formatter.nvim")
vim.cmd("packadd twilight.nvim")
vim.cmd("packadd vim-jsx-pretty")
vim.cmd("packadd vimwiki")
vim.cmd("packadd zen-mode.nvim")
vim.cmd("packadd twilight.nvim")
require("zen-mode").setup({})

vim.cmd("nnoremap <leader>z :ZenMode<CR>")
-- require("lsp_signature").setup()

local prettierFmt = function()
  return {
    exe = "prettier",
    args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote" },
    stdin = true,
  }
end

local eslintFmt = function()
  return {
    exe = "eslint_d",
    args = {
      "--stdin",
      "--stdin-filename",
      vim.api.nvim_buf_get_name(0),
      "--fix-to-stdout",
    },
    stdin = true,
  }
end

require("formatter").setup({
  logging = false,
  filetype = {
    typescript = { prettierFmt, eslintFmt },
    typescriptreact = { prettierFmt, eslintFmt },
    javascript = { prettierFmt, eslintFmt },
    javascriptreact = { prettierFmt, eslintFmt },
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
    python = { exe = "black", stdin = false },
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
      autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx,*.rs,*.lua FormatWrite
      autocmd BufWritePre *.py execute ':Black'
      au BufNewFile,BufRead *.prisma setfiletype graphql
    augroup END
  ]],
  true
)

require("lspconfig").prismals.setup({})
