-- vim.cmd([[
-- let g:neoformat_c_clangformat = {
--             \ 'exe': 'clang-format',
--             \ 'args': ['-style="{BasedOnStyle: llvm, IndentWidth: 4}"', '-s 4', '-E'],
--             \ 'stdin': 1,
--             \ }
-- ]])
--
-- vim.cmd([[ let g:neoformat_cpp_clangformat = {
--             \ 'exe': 'clang-format',
--             \ 'args': ['-style="{BasedOnStyle: llvm, IndentWidth: 4}"', '-s 4', '-E'],
--             \ 'stdin': 1,
--             \ }
-- ]])

vim.g.neoformat_enabled_python = { "black" }
vim.g.neoformat_enabled_javascript = { "prettier" }
vim.g.neoformat_enabled_c = { "clangformat" }
vim.g.neoformat_enabled_cpp = { "clangformat" }

-- Enable alignment
vim.g.neoformat_basic_format_align = 1

-- Enable tab to spaces conversion
vim.g.neoformat_basic_format_retab = 1

-- Enable trimmming of trailing whitespace
vim.g.neoformat_basic_format_trim = 1

-- autocmd for formatting files on save.

-- vim.cmd([[
--   augroup fmt
--     autocmd!
--     autocmd BufWritePre * undojoin | Neoformat
--   augroup END
-- ]])
