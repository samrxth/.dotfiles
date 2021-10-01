local g = vim.g

g.kyoto_extra_plugins = {
  "folke/zen-mode.nvim",
  "folke/twilight.nvim",
  "maxmellon/vim-jsx-pretty",
}

g.vimwiki_list = {
  {
    path = "~/Documents/vimwiki",
    syntax = "markdown",
    ext = ".md",
    custom_wiki2html = "vimwiki_markdown",
    template_ext = ".md",
  },
  {
    path = "~/Documents/coding",
    syntax = "markdown",
    ext = ".md",
    custom_wiki2html = "vimwiki_markdown",
    template_ext = ".md",
  },
  {
    path = "~/code/internnova-docs",
    syntax = "markdown",
    ext = ".md",
    path_html = "~/code/internnova-docs/",
    custom_wiki2html = "vimwiki_markdown",
    template_ext = ".md",
  },
}
