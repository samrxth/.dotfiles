local packer = require("packer")
local use = packer.use

return packer.startup(
    function()
        use "wbthomason/packer.nvim"

        use "akinsho/nvim-bufferline.lua"
        use {'hoob3rt/lualine.nvim'}

        -- color related stuff
        use {
            'shaunsingh/nord.nvim',
        }

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
	use "neoclide/coc.nvim"
    end,
    {
        display = {
            border = {"┌", "─", "┐", "│", "┘", "─", "└", "│"}
        }
    }
)
