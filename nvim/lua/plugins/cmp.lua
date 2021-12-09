local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  mapping = {
    ["<TAB>"] = cmp.mapping.select_next_item({
      behavior = cmp.SelectBehavior.Insert,
    }),
    ["<S-TAB>"] = cmp.mapping.select_prev_item({
      behavior = cmp.SelectBehavior.Insert,
    }),
    ["<C-n>"] = cmp.mapping.select_next_item({
      behavior = cmp.SelectBehavior.Insert,
    }),
    ["<C-p>"] = cmp.mapping.select_prev_item({
      behavior = cmp.SelectBehavior.Insert,
    }),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "ultisnips" }, -- For ultisnips users.
  }, {
    { name = "buffer" },
  }),
  formatting = {
    format = lspkind.cmp_format(),
  },
})
