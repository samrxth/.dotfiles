-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
local lualine = require("lualine")
local colors = require("onenord.colors").load()

local onepog = {}

onepog.normal = {
  a = { fg = colors.bg, bg = colors.cyan, gui = "bold" },
  b = { fg = colors.cyan, bg = colors.highlight },
  c = { fg = colors.fg, bg = colors.active },
}

onepog.insert = {
  a = { fg = colors.bg, bg = colors.green, gui = "bold" },
  b = { fg = colors.green, bg = colors.highlight },
}

onepog.command = {
  a = { fg = colors.bg, bg = colors.yellow, gui = "bold" },
  b = { fg = colors.yellow, bg = colors.highlight },
}

onepog.visual = {
  a = { fg = colors.bg, bg = colors.purple, gui = "bold" },
  b = { fg = colors.purple, bg = colors.highlight },
}

onepog.replace = {
  a = { fg = colors.bg, bg = colors.red, gui = "bold" },
  b = { fg = colors.red, bg = colors.highlight },
}

onepog.inactive = {
  a = { fg = colors.light_gray, bg = colors.floating, gui = "bold" },
  b = { fg = colors.light_gray, bg = colors.floating },
  c = { fg = colors.light_gray, bg = colors.active },
}

lualine.setup({
  options = {
    theme = onepog,
    component_separators = "|",
    section_separators = { left = "", right = "" },
  },
  sections = {
    lualine_a = {
      { "mode", separator = { left = "" }, right_padding = 2 },
    },
    lualine_b = { "filename", "branch" },
    lualine_c = { "fileformat" },
    lualine_x = {},
    lualine_y = { "filetype", "progress" },
    lualine_z = {
      { "location", separator = { right = "" }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { "filename" },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { "location" },
  },
  tabline = {},
  extensions = {},
})
