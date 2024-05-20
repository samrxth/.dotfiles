local function on_attach(client, bufnr)
  client.resolved_capabilities.document_formatting = false
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
  vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
end

require("mason").setup()

-- local lsp_installer = require("nvim-lsp-installer")
-- lsp_installer.on_server_ready(function(server)
--   server:setup(require("lspconf.config")[server.name] or {
--     on_attach = on_attach,
--     settings = {},
--   })
--
--   vim.cmd([[ do User LspAttachBuffers ]])
-- end)
