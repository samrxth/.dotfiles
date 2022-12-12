local g = vim.g

g.theme = "onedark"
g.statusline_style = "default"

g.vimwiki_list = {
  {
    path = "~/Documents/vimwiki",
    syntax = "markdown",
    ext = ".md",
    custom_wiki2html = "vimwiki_markdown",
    template_ext = ".md",
  },
  {
    path = "~/Desktop/1M1B/plans/",
    syntax = "markdown",
    ext = ".md",
    custom_wiki2html = "vimwiki_markdown",
    template_ext = ".md",
  },
  {
    path = "~/Desktop/1M1B/government-schemes",
    syntax = "markdown",
    ext = ".md",
    custom_wiki2html = "vimwiki_markdown",
    template_ext = ".md",
  },
  {
    path = "~/Documents/vimwiki/coding",
    syntax = "markdown",
    ext = ".md",
    custom_wiki2html = "vimwiki_markdown",
    template_ext = ".md",
  },
  {
    path = "~/code/indocs",
    syntax = "markdown",
    ext = ".md",
    path_html = "~/code/indocs/",
    custom_wiki2html = "vimwiki_markdown",
    template_ext = ".md",
  },
}

g.lsp_config = {
  lua = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim", "map" },
        },
      },
    },
  },
}

g.coq_settings = {
  auto_start = "shut-up",
  keymap = {
    jump_to_mark = "<c-q>",
  },
}

g.bufferline = {
  animation = true,
  auto_hide = true,
  tabpages = true,
  closable = true,
  clickable = true,
  icons = true,
  icon_custom_colors = true,

  -- Configure icons on the bufferline.
  icon_separator_active = "▎",
  icon_separator_inactive = "▎",
  icon_close_tab = "",
  icon_close_tab_modified = "●",
  icon_pinned = "車",

  insert_at_end = true,

  -- Sets the maximum padding width with which to surround each tab
  maximum_padding = 1,

  -- Sets the maximum buffer name length.
  maximum_length = 30,
  semantic_letters = true,
}

g.UltiSnipsJumpForwardTrigger = "<c-q>"
g.UltiSnipsJumpBackwardTrigger = "<c-m>"

g.indent_blankline_filetype_exclude = { "alpha", "NvimTree", "packer" }
g.indent_blankline_buftype_exclude = { "terminal" }
