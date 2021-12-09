_G.map = function(mode, mapping, command, options)
  if options == nil then
    options = { silent = true }
  end
  if options then
    options = vim.tbl_extend("force", options, options)
  end
  vim.api.nvim_set_keymap(mode, mapping, command, options)
end
