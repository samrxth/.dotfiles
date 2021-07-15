local packer = require("packer")
local use = packer.use

return packer.startup(
    function()
        use "wbthomason/packer.nvim"

        use {
          "folke/which-key.nvim",
        }

        use "akinsho/nvim-bufferline.lua"

        use 'ful1e5/onedark.nvim'

        use "jiangmiao/auto-pairs"

        use 'famiu/feline.nvim'

        use "mlaursen/vim-react-snippets"

        use "jremmen/vim-ripgrep"

        use "lukas-reineke/indent-blankline.nvim"

        use "prettier/vim-prettier"

        use "kyazdani42/nvim-web-devicons"

        use "vimwiki/vimwiki"

        use {
          'lewis6991/gitsigns.nvim',
          requires = {
            'nvim-lua/plenary.nvim'
          },
          config = function()
            require('gitsigns').setup()
          end
        }

        use "glepnir/dashboard-nvim"

        use {
          'nvim-telescope/telescope.nvim',
          requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
        }

        use "neoclide/coc.nvim"
    end,
    {
        display = {
            border = {"┌", "─", "┐", "│", "┘", "─", "└", "│"}
        }
    }
)
