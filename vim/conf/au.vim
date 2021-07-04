autocmd BufWritePre * :%s/\s\+$//e
autocmd BufRead,BufNewFile *.md,*.wiki,*.txt setlocal spell

autocmd BufDelete * if empty(filter(tabpagebuflist(), '!buflisted(v:val)')) | Startify | endif

augroup language_react
    autocmd!
    autocmd bufnewfile,bufread *.tsx set filetype=javascriptreact
augroup END
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
