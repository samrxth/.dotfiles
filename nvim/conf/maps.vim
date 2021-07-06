let g:mapleader = " "

command! Conf :e ~/.config/nvim/init.vim
command! Cdconf :cd ~/.config/nvim

inoremap <C-a> <C-o>0
inoremap <C-b> <C-o>$
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
map <Up> <NOP>
map <Down> <NOP>
map <Left> <NOP>
map <Right> <NOP>
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
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
  nnoremap <silent> <C-H> :vertical resize -4<CR>
  nnoremap <silent> <C-L> :vertical resize +4><CR>
  nnoremap <silent> <C-J> :resize -4<CR>
  nnoremap <silent> <C-K> :resize +4<CR>
  tnoremap <silent> <C-H> :vertical resize -4<CR>
  tnoremap <silent> <C-L> :vertical resize +4><CR>
  tnoremap <silent> <C-J> :resize -4<CR>
  tnoremap <silent> <C-K> :resize +4<CR>
endif

nnoremap <leader>ff :Telescope find_files hidden=true<CR>
nnoremap <leader>fb :Telescope buffers<CR>
nnoremap <leader>fh :Telescope help_tags<CR>
nnoremap <leader>fg :Telescope live_grep<CR>
nnoremap <leader>nn :CocCommand explorer<CR>
nnoremap <leader>gs :Magit<CR>
nnoremap <leader>vf :Vista finder coc<CR>
nnoremap <leader>vv :Vista coc<CR>

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
