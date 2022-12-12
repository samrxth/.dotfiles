require("lspconf.servers")

vim.fn.sign_define(
  "LspDiagnosticsSignError",
  { text = "", numhl = "LspDiagnosticsDefaultError" }
)
vim.fn.sign_define(
  "LspDiagnosticsSignWarning",
  { text = "", numhl = "LspDiagnosticsDefaultWarning" }
)
vim.fn.sign_define(
  "LspDiagnosticsSignInformation",
  { text = "", numhl = "LspDiagnosticsDefaultInformation" }
)
vim.fn.sign_define(
  "LspDiagnosticsSignHint",
  { text = "", numhl = "LspDiagnosticsDefaultHint" }
)

-- set default prefix.
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    -- virtual_text = false,
    virtual_text = { prefix = "" },
    signs = true,
    update_in_insert = false,
  }
)

require("null-ls").setup({
  sources = {
    require("null-ls").builtins.formatting.google_java_format,
    require("null-ls").builtins.formatting.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ "**/.eslint_drc*" })
      end,
    }),
    require("null-ls").builtins.formatting.stylua,
    require("null-ls").builtins.formatting.prettier_d_slim,
    require("null-ls").builtins.diagnostics.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ "**/.eslintrc*" })
      end,
    }),
    require("null-ls").builtins.completion.spell,
  },
})

require("lspconfig").emmet_ls.setup({
  filetypes = {
    "html",
    "css",
    "jsx",
    "tsx",
    "javascriptreact",
    "typescriptreact",
  },
})
