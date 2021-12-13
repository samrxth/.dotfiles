vim.cmd([[
" Turn off line numbers and start insert mode in terminal
autocmd TermOpen * setlocal nonumber norelativenumber | startinsert

autocmd InsertLeave * execute 'normal! mI'

au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=150, on_visual=true}

" Set indenting for python
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END
]])
