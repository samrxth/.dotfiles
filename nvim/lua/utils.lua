_G.map = function(mode, mapping, command, options)
  if options == nil then
    options = { silent = true }
  end
  if options then
    options = vim.tbl_extend("force", options, options)
  end
  vim.api.nvim_set_keymap(mode, mapping, command, options)
end

local _M = {}

_M.powerline = {
  circle = {
    left = "",
    right = "",
  },
  arrow = {
    left = "",
    right = "",
  },
  triangle = {
    left = "",
    right = "",
  },
  none = {
    left = "",
    right = "",
  },
}

_M.signs = { Error = "", Warn = "", Hint = "", Info = "" }

return _M
