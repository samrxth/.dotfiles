autocmd BufDelete * if empty(filter(tabpagebuflist(), '!buflisted(v:val)')) | Startify | endif
autocmd TermOpen * setlocal listchars= nonumber norelativenumber
autocmd TermOpen * startinsert
autocmd BufEnter,BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufRead,BufNewFile *.md,*.wiki,*.txt setlocal spell

augroup language_react
    autocmd!
    autocmd bufnewfile,bufread *.tsx set filetype=javascriptreact
augroup END

autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Prettier
autocmd BufWritePre *.rs RustFmt

augroup python
  autocmd!
  autocmd BufRead,BufNewFile *.py set tabstop=4
  autocmd BufRead,BufNewFile *.py set shiftwidth=4
augroup END
