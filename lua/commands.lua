-- "" Remember cursor position
vim.cmd[[augroup vimrc-remember-cursor-position]]
  vim.cmd[[autocmd!]]
  vim.cmd[[autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]]
vim.cmd[[augroup END]]
