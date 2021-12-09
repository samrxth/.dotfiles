-- nvim-treesitter/nvim-treesitter
require("nvim-treesitter.configs").setup({
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
    },
  },
  context_commentstring = {
    enable = true,
  },
})
