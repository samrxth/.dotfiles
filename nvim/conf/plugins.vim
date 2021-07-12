call plug#begin('~/.config/nvim/plugged')
    Plug 'romgrk/doom-one.vim'
    Plug 'folke/which-key.nvim'
    Plug 'norcalli/nvim-base16.lua'
    Plug 'alvan/vim-closetag'
    Plug 'dense-analysis/ale'
    Plug 'SirVer/ultisnips'
    Plug 'mlaursen/vim-react-snippets'
    Plug 'lewis6991/gitsigns.nvim'
    Plug 'vim-syntastic/syntastic'
    Plug 'klen/python-mode'
    Plug 'akinsho/nvim-bufferline.lua'
    Plug 'rust-lang/rust.vim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'
    Plug 'liuchengxu/vista.vim'
    Plug 'jremmen/vim-ripgrep'
    Plug 'tpope/vim-fugitive'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'norcalli/nvim-base16.lua'
    Plug 'kosayoda/nvim-lightbulb'
    Plug 'junegunn/goyo.vim'
    Plug 'dhruvasagar/vim-table-mode'
    Plug 'ap/vim-css-color'
    Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
    Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
    Plug 'leafgarland/typescript-vim'
    Plug 'HerringtonDarkholme/yats.vim'
    Plug 'wakatime/vim-wakatime'
    Plug 'mhinz/vim-startify'
    Plug 'MaxMEllon/vim-jsx-pretty'
    Plug 'dhruvasagar/vim-table-mode',{'for': 'markdown', 'do': ':TableFormat'}
    Plug 'lervag/vimtex', {'for': 'tex'}
    Plug 'Valloric/MatchTagAlways'
    Plug 'vimwiki/vimwiki'
call plug#end()

colorscheme doom-one

lua << EOF
  require("which-key").setup {}
EOF
