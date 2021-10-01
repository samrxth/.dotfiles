vim.cmd("packadd twilight.nvim")
vim.cmd("packadd vim-jsx-pretty")
vim.cmd("packadd vimwiki")
vim.cmd("packadd zen-mode.nvim")
vim.cmd("packadd twilight.nvim")
vim.cmd("packadd diagnosticls-configs-nvim")

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

require("lspconfig").prismals.setup({
  cmd = { "prisma-language-server", "--stdio", "--nolazy", "--inspect=6009" },
})

local eslint = {
  sourceName = "eslint",
  command = "eslint_d",
  rootPatterns = { ".eslintrc.js", "package.json" },
  debounce = 100,
  args = { "--stdin", "--stdin-filename", "%filepath", "--format", "json" },
  parseJson = {
    errorsRoot = "[0].messages",
    line = "line",
    column = "column",
    endLine = "endLine",
    endColumn = "endColumn",
    message = "${message} [${ruleId}]",
    security = "severity",
  },
  securities = { [2] = "error", [1] = "warning" },
}
local flake = require("diagnosticls-configs.linters.flake8")

prettier = require("diagnosticls-configs.formatters.prettier")
local stylua = require("diagnosticls-configs.formatters.stylua")
local autopep8 = require("diagnosticls-configs.formatters.autopep8")
local eslint_fmt = require("diagnosticls-configs.formatters.eslint_fmt")

local dlsconfig = require("diagnosticls-configs")

dlsconfig.init({})
dlsconfig.setup({
  ["json"] = {
    formatter = prettier,
  },
  ["javascript"] = {
    linter = eslint,
    formatter = { prettier, eslint_fmt },
  },
  ["javascriptreact"] = {
    linter = eslint,
    formatter = { prettier, eslint_fmt },
  },
  ["typescript"] = {
    linter = eslint,
    formatter = { prettier, eslint_fmt },
  },
  ["typescriptreact"] = {
    linter = eslint,
    formatter = { prettier, eslint_fmt },
  },
  ["python"] = {
    linter = flake,
    formatter = autopep8,
  },
  ["lua"] = {
    formatter = stylua,
  },
})

vim.cmd(
  "autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx,*.rs,*.py,*.lua,*.json lua vim.lsp.buf.formatting()"
)
