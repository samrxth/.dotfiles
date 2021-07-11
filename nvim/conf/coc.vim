command! -nargs=0 Format :call CocAction('format')
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-emmet',
  \ 'coc-eslint',
  \ 'coc-pyright',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-json',
  \ 'coc-explorer',
  \ 'coc-python',
  \ 'coc-jedi',
  \ 'coc-vimlsp',
  \ ]

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

xmap <leader>aa  <Plug>(coc-codeaction-selected)<CR>
nmap <leader>aa  <Plug>(coc-codeaction-selected)<CR>

nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> gd :call CocAction('jumpDefinition', 'drop')<CR>
nnoremap <silent> gy :call CocAction('jumpTypeDefinition', 'drop')<CR>
