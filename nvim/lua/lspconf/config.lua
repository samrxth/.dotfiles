local M = {}

M.on_attach = function (client, bufnr)
  client.resolved_capabilities.document_formatting = false

  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
end

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = "",
  }
  vim.lsp.buf.execute_command(params)
end

M.tsserver = {
  -- Needed for inlayHints. Merge this table with your settings or copy
  -- it from the source if you want to add your own init_options.
  init_options = require("nvim-lsp-ts-utils").init_options,
  --
  on_attach = function(client, bufnr)
    local ts_utils = require("nvim-lsp-ts-utils")

    -- defaults
    ts_utils.setup({
      debug = false,
      disable_commands = false,
      enable_import_on_completion = false,

      -- import all
      import_all_timeout = 5000, -- ms
      -- lower numbers = higher priority
      import_all_priorities = {
        same_file = 1, -- add to existing import statement
        local_files = 2, -- git files or files with relative path markers
        buffer_content = 3, -- loaded buffer content
        buffers = 4, -- loaded buffer names
      },
      import_all_scan_buffers = 100,
      import_all_select_source = false,

      -- filter diagnostics
      filter_out_diagnostics_by_severity = {},
      filter_out_diagnostics_by_code = {},

      -- inlay hints
      auto_inlay_hints = true,
      inlay_hints_highlight = "Comment",

      -- update imports on file move
      update_imports_on_move = false,
      require_confirmation_on_move = false,
      watch_dir = nil,
    })

    -- required to fix code action ranges and filter diagnostics
    ts_utils.setup_client(client)

    -- no default maps, so you may want to define some here
    local opts = { silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)
  client.resolved_capabilities.document_formatting = false
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  end,
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports",
    },
  },
}

M.jsonls = {
  filetypes = { "json", "jsonc" },
  on_attach = M.on_attach,
  settings = {
    json = {
      -- Schemas https://www.schemastore.org
      schemas = {
        {
          fileMatch = { "package.json" },
          url = "https://json.schemastore.org/package.json",
        },
        {
          fileMatch = { "tsconfig*.json" },
          url = "https://json.schemastore.org/tsconfig.json",
        },
        {
          fileMatch = {
            ".prettierrc",
            ".prettierrc.json",
            "prettier.config.json",
          },
          url = "https://json.schemastore.org/prettierrc.json",
        },
        {
          fileMatch = { ".eslintrc", ".eslintrc.json" },
          url = "https://json.schemastore.org/eslintrc.json",
        },
        {
          fileMatch = { ".babelrc", ".babelrc.json", "babel.config.json" },
          url = "https://json.schemastore.org/babelrc.json",
        },
        {
          fileMatch = { "lerna.json" },
          url = "https://json.schemastore.org/lerna.json",
        },
        {
          fileMatch = { "now.json", "vercel.json" },
          url = "https://json.schemastore.org/now.json",
        },
        {
          fileMatch = {
            ".stylelintrc",
            ".stylelintrc.json",
            "stylelint.config.json",
          },
          url = "http://json.schemastore.org/stylelintrc.json",
        },
      },
    },
  },
}

M.sumneko_lua = {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
    on_attach = M.on_attach
  },
  on_attach = M.on_attach
}

M.prismals = {
  cmd = { "prisma-language-server", "--stdio", "--nolazy", "--inspect=6009" },
}

return M
