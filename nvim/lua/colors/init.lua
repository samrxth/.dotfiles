local M = {}

-- if theme given, load given theme if given, otherwise use the global theme var
M.init = function(theme)
  if not theme then
    theme = vim.g.theme
  end

  local base16 = require("base16")

  -- first load the base16 theme
  base16(base16.themes(theme), true)
  require("colors.highlights")
end

-- returns a table of colors for given or current theme
M.get = function(theme)
  if not theme then
    theme = vim.g.theme
  end

  return require("hl_themes." .. theme)
end

return M
