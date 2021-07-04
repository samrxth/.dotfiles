let g:mapleader = " "

nnoremap <leader>nn :CocCommand explorer<CR>
nnoremap y "*y
vnoremap y "*y
nnoremap x "*x
vnoremap x "*x
nnoremap p "*p
nnoremap gn :bn<CR>
nnoremap gp :bp<CR>
nnoremap bd :bd<CR>
vnoremap p "*p
inoremap jk <ESC>
nnoremap <leader>a ggVG
nnoremap <D-v> "*p
nnoremap <D-c> "*y
nnoremap <D-x> "*x
inoremap <expr> <CR> getline(".")[col(".")-2:col(".")-1]=="{}" ? "<cr><esc>O" : "<cr>"
" Disable arrow keys (Vim don't need this)
map <Up> <NOP>
map <Down> <NOP>
map <Left> <NOP>
map <Right> <NOP>
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
cnoreabbrev q bd
cnoreabbrev wq w<bar>bd
cnoreabbrev Wq w<bar>bd
cnoreabbrev WQ w<bar>bd
cnoreabbrev Qa qa
cnoreabbrev Wqa wqa
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev B buffer
nnoremap Q <Nop>
if bufwinnr(1)
  noremap <silent> <C-H> :vertical resize -4<CR>
  noremap <silent> <C-L> :vertical resize +4><CR>
  noremap <silent> <C-J> :resize -4<CR>
  noremap <silent> <C-K> :resize +4<CR>
endif
