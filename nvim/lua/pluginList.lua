local packer = require("packer")
local use = packer.use

return packer.startup(
    function()
        use "wbthomason/packer.nvim"

        use "akinsho/nvim-bufferline.lua"

        use "hoob3rt/lualine.nvim"

        use "jiangmiao/auto-pairs"

        use "mlaursen/vim-react-snippets"

        use "mlaursen/vim-react-snippets"

        use "lukas-reineke/indent-blankline.nvim"

        use "prettier/vim-prettier"

        -- color related stuff
        use "arcticicestudio/nord-vim"

        use "kyazdani42/nvim-web-devicons"

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
