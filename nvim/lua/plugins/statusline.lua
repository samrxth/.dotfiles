local feline = require("feline")

local lsp = require("feline.providers.lsp")
local vi_mode_utils = require("feline.providers.vi_mode")
local colors = require("colors").colors
local signs = require("utils").signs
local powerline = require("utils").powerline.triangle

local vi_mode_colors = {
  NORMAL = colors.cyan,
  INSERT = colors.green,
  VISUAL = colors.magenta,
  OP = colors.green,
  BLOCK = colors.blue,
  REPLACE = colors.orange,
  ["V-REPLACE"] = colors.orange,
  ENTER = colors.cyan,
  MORE = colors.cyan,
  SELECT = colors.yellow,
  COMMAND = colors.green,
  SHELL = colors.red,
  TERM = colors.red,
  NONE = colors.yellow,
}

local vi_mode_text = {
  n = "NORMAL",
  i = "INSERT",
  v = "VISUAL",
  [""] = "V-BLOCK",
  V = "V-LINE",
  c = "COMMAND",
  no = "UNKNOWN",
  s = "SELECT",
  S = "SELECT",
  ic = "UNKNOWN",
  R = "REPLACE",
  Rv = "VIRTUAL",
  cv = "UNKWON",
  ce = "UNKNOWN",
  r = "REPLACE",
  rm = "--MORE",
  t = "TERMINAL",
}

local icons = {
  linux = " ",
  macos = " ",
  windows = " ",

  indent = "הּ",

  errors = signs.Error,
  warns = signs.Warn,
  infos = signs.Info,
  hints = signs.Hint,

  lsp = "",
  git = {
    branch = "",
    added = " ",
    modified = " ",
    removed = " ",
  },
}

local function file_osinfo()
  local os = vim.bo.fileformat:upper()
  local icon
  if os == "UNIX" then
    icon = icons.linux
  elseif os == "MAC" then
    icon = icons.macos
  else
    icon = icons.windows
  end
  return icon .. os
end

local function get_lsp_diagnostics()
  return {
    errors = lsp.get_diagnostics_count("Error"),
    warns = lsp.get_diagnostics_count("Warn"),
    infos = lsp.get_diagnostics_count("Info"),
    hints = lsp.get_diagnostics_count("Hint"),
  }
end

local function render_diagnostics(fn, type)
  local icon = icons[type]
  return function()
    local diag = fn()[type]
    return icon .. " " .. diag
  end
end

local conditions = {
  diagnostic_enable = function(fn, type)
    return function()
      local diagnostics_count = fn()[type]
      return diagnostics_count and diagnostics_count ~= 0
    end
  end,
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand("%:p:h")
    local gitdir = vim.fn.finddir(".git", filepath .. ";")
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

local comps = {
  vi_mode = {
    sep = {
      left = {
        provider = " ",
        hl = function()
          return {
            name = vi_mode_utils.get_mode_highlight_name(),
            bg = vi_mode_utils.get_mode_color(),
          }
        end,
      },
      right = {
        provider = " ",
        hl = function()
          return {
            name = vi_mode_utils.get_mode_highlight_name(),
            bg = vi_mode_utils.get_mode_color(),
          }
        end,
      },
    },
    text = {
      provider = function()
        local current_text = vi_mode_text[vim.fn.mode()] .. " "
        return current_text
      end,
      hl = function()
        return {
          name = vi_mode_utils.get_mode_highlight_name(),
          fg = vi_mode_utils.get_mode_color(),
          bg = colors.grey14,
          style = "bold",
        }
      end,
      left_sep = {
        str = " ",
        hl = {
          bg = colors.grey14,
        },
      },

      right_sep = powerline.right,
    },
  },

  file = {
    info = {
      provider = "file_info",
      left_sep = " ",
      right_sep = " ",
      hl = {
        fg = colors.blue,
        style = "bold",
      },
    },
    encoding = {
      provider = "file_encoding",
      left_sep = " ",
      right_sep = " ",
    },
    type = {
      provider = "file_type",
      left_sep = " ",
      right_sep = " ",
    },
    os = {
      provider = file_osinfo,
      left_sep = " ",
      right_sep = " ",
      hl = {
        fg = colors.grey9,
        style = "bold",
      },
    },
    indent_size = {
      icon = "הּ",
      provider = function()
        return " " .. vim.opt.tabstop:get()
      end,
      left_sep = " ",
      right_sep = " ",
      hl = { fg = colors.grey9 },
    },
    size = {
      provider = "file_size",
      left_sep = " ",
      right_sep = " ",
    },
    position = {
      provider = "position",
      left_sep = " ",
      right_sep = " ",
    },
  },
  line_percentage = {
    provider = "line_percentage",
    left_sep = " ",
    right_sep = " ",
    hl = {
      style = "bold",
    },
  },
  scroll_bar = {
    provider = "scroll_bar",
    hl = {
      style = "bold",
    },
  },
  diagnostics = {
    error = {
      provider = render_diagnostics(get_lsp_diagnostics, "errors"),
      left_sep = " ",
      enabled = conditions.diagnostic_enable(get_lsp_diagnostics, "errors"),
      hl = {
        fg = colors.red,
      },
    },
    warn = {
      provider = render_diagnostics(get_lsp_diagnostics, "warns"),
      left_sep = " ",
      enabled = conditions.diagnostic_enable(get_lsp_diagnostics, "warns"),
      hl = {
        fg = colors.yellow,
      },
    },
    info = {
      provider = render_diagnostics(get_lsp_diagnostics, "infos"),
      left_sep = " ",
      enabled = conditions.diagnostic_enable(get_lsp_diagnostics, "infos"),
      hl = {
        fg = colors.blue,
      },
    },
    hint = {
      provider = render_diagnostics(get_lsp_diagnostics, "hints"),
      left_sep = " ",
      enabled = conditions.diagnostic_enable(get_lsp_diagnostics, "hints"),
      hl = {
        fg = colors.cyan,
      },
    },
  },
  lsp = {
    name = {
      provider = "lsp_client_names",
      left_sep = " ",
      right_sep = " ",
      icon = icons.lsp .. " ",
      hl = {
        fg = colors.grey9,
      },
    },
  },
  git = {
    branch = {
      provider = "git_branch",
      icon = icons.git.branch .. " ",
      enabled = conditions.check_git_workspace(),
      hl = {
        fg = colors.magenta,
        bg = colors.grey14,
        style = "bold",
      },
      left_sep = {
        str = " ",
        hl = {
          bg = colors.grey14,
        },
      },
      right_sep = {
        str = " ",
        hl = {
          bg = colors.grey14,
        },
      },
    },
    add = {
      provider = "git_diff_added",
      hl = {
        fg = colors.green,
        bg = colors.grey14,
      },
      icon = icons.git.added,
      left_sep = {
        str = " ",
        hl = {
          bg = colors.grey14,
        },
      },
    },
    change = {
      provider = "git_diff_changed",
      hl = {
        fg = colors.orange,
        bg = colors.grey14,
      },
      icon = icons.git.modified,
      left_sep = {
        str = " ",
        hl = {
          bg = colors.grey14,
        },
      },
    },
    remove = {
      provider = "git_diff_removed",
      hl = {
        fg = colors.red,
        bg = colors.grey14,
      },
      icon = icons.git.removed,
      left_sep = {
        str = " ",
        hl = {
          bg = colors.grey14,
        },
      },
    },
  },
}

local properties = {
  force_inactive = {
    filetypes = {},
    buftypes = { "terminal" },
    bufnames = {},
  },
}

feline.setup({
  theme = {
    fg = colors.grey9,
    bg = colors.grey13,
  },
  highlight_reset_triggers = {},
  components = {
    active = {
      {
        comps.vi_mode.sep.left,
        comps.vi_mode.text,
        comps.file.type,
        comps.file.info,
        comps.file.size,
        comps.line_percentage,
        comps.scroll_bar,
        comps.file.position,
        comps.diagnostics.error,
        comps.diagnostics.warn,
        comps.diagnostics.hint,
        comps.diagnostics.info,
      },
      {
        comps.lsp.name,
        comps.file.os,
        comps.file.encoding,
        comps.file.indent_size,
        comps.git.add,
        comps.git.change,
        comps.git.remove,
        comps.git.branch,
        comps.vi_mode.sep.right,
      },
    },
    inactive = {
      {
        comps.vi_mode.left,
        comps.vi_mode_text,
        comps.file.info,
      },
      {},
    },
  },
  properties = properties,
  vi_mode_colors = vi_mode_colors,
})
