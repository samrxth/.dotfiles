require("Comment").setup({
  pre_hook = function(ctx)
    return require("ts_context_commentstring.internal").calculate_commentstring()
  end,
})

require('ts_context_commentstring').setup()
vim.g.skip_ts_context_commentstring_module = true
