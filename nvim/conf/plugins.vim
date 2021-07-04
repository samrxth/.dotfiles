call plug#begin('~/.config/nvim/plugged')
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'rakr/vim-one'
    Plug 'norcalli/nvim-base16.lua'
    Plug 'akinsho/nvim-bufferline.lua'
    Plug 'junegunn/goyo.vim'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'dhruvasagar/vim-table-mode'
    Plug 'ap/vim-css-color'
    Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
    Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
    Plug 'leafgarland/typescript-vim'
    Plug 'HerringtonDarkholme/yats.vim'
    Plug 'wakatime/vim-wakatime'
    Plug 'mhinz/vim-startify'
    Plug 'bling/vim-airline'
    Plug 'MaxMEllon/vim-jsx-pretty'
    Plug 'dhruvasagar/vim-table-mode',{'for': 'markdown', 'do': ':TableFormat'}
    Plug 'lervag/vimtex', {'for': 'tex'}
    Plug 'Valloric/MatchTagAlways'
    Plug 'vimwiki/vimwiki'
call plug#end()

colorscheme one
