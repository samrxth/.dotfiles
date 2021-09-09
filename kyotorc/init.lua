vim.cmd("packadd formatter.nvim")
vim.cmd("packadd twilight.nvim")
vim.cmd("packadd vim-jsx-pretty")
vim.cmd("packadd vimwiki")
vim.cmd("packadd zen-mode.nvim")
vim.cmd("packadd twilight.nvim")
vim.cmd("packadd vim-prisma")
vim.cmd(
  'command OrganizeImports lua vim.lsp.buf.execute_command({command = "_typescript.organizeImports", arguments = {vim.fn.expand("%:p")}})'
)
require("zen-mode").setup({})

vim.cmd("nnoremap <leader>z :ZenMode<CR>")
-- require("lsp_signature").setup()

local prettier = function()
  return {
    exe = "prettier",
    args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
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

require("lspconfig").prismals.setup(coq.lsp_ensure_capabilities({
  cmd = { "prisma-language-server", "--stdio", "--nolazy", "--inspect=6009" },
}))
