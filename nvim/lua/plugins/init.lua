require("packer").startup(function(use)
  -- Packer needs itself
  use("wbthomason/packer.nvim")

  -- Lsp
  use("neovim/nvim-lspconfig")
  use("williamboman/nvim-lsp-installer")
  use("tami5/lspsaga.nvim")
  use("jose-elias-alvarez/null-ls.nvim")
  use({
    "jose-elias-alvarez/nvim-lsp-ts-utils",
    requires = { "nvim-lua/plenary.nvim" },
  })

  -- GOD
  use("github/copilot.vim")

  -- Completion
  use({
    "ms-jpq/coq_nvim",
    requires = { "ms-jpq/coq.thirdparty", "ms-jpq/coq.artifacts" },
  })

  -- Formatting
  use("mhartington/formatter.nvim")
  use("creativenull/diagnosticls-configs-nvim")

  -- Treesitter/Highlighting
  use("JoosepAlviste/nvim-ts-context-commentstring")
  use({
    "nvim-treesitter/nvim-treesitter",
    branch = "0.5-compat",
    run = ":TSUpdate",
  })
  use("pantharshit00/vim-prisma")

  -- File finders
  use({
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
  })
  use({ "camspiers/snap" })
  -- use({
  --   "nvim-telescope/telescope.nvim",
  --   requires = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-lua/popup.nvim",
  --   },
  -- })

  -- Git related plugins
  use("lewis6991/gitsigns.nvim")
  use("kdheepak/lazygit.nvim")
  use("APZelos/blamer.nvim")

  -- UI
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })
  use({
    "romgrk/barbar.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function() end,
  })
  use({
    "goolord/alpha-nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
  })
  use({
    "VonHeikemen/fine-cmdline.nvim",
    requires = {
      { "MunifTanjim/nui.nvim" },
    },
  })
  use("lukas-reineke/indent-blankline.nvim")

  -- Colorschemes
  -- use("folke/tokyonight.nvim")
  -- use("ful1e5/onedark.nvim")
  -- use("rmehri01/onenord.nvim")
  -- use({ "eddyekofo94/gruvbox-flat.nvim", branch = "local" })
  use({
    "catppuccin/nvim",
    as = "catppuccin",
  })

  -- Productivity
  use("vimwiki/vimwiki")
  use("folke/zen-mode.nvim")

  -- Extras(but imporant)
  use("jiangmiao/auto-pairs")
  use("liuchengxu/vista.vim")
  use({
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  })
  use("numToStr/Comment.nvim")
  use("folke/which-key.nvim")
  use("andweeb/presence.nvim")
end)

require("plugins.icons")
require("plugins.formatter-nvim")
require("plugins.nvimtree")
require("plugins.lsp-saga")
require("plugins.treesitter")
require("plugins.zenmode")
require("plugins.trouble-nvim")
-- require("plugins.telescope-nvim")
require("plugins.comments")
require("plugins.whichkey")
require("plugins.coq3p")
require("plugins.statusline")
require("plugins.snap")
require("plugins.colorscheme")
require("plugins.indent-blankline")
require("presence"):setup()
