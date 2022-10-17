vim.cmd([[
let g:neoformat_c_clangformat = {
    \ 'exe': 'clang-format',
    \ 'args': ['-style="{BasedOnStyle: llvm, IndentWidth: 4}"', '-assume-filename', '"%:p"' ],
    \ 'stdin': 1,
    \ }
]])

vim.cmd([[
let g:neoformat_cpp_clangformat = {
    \ 'exe': 'clang-format',
    \ 'args': ['-style="{BasedOnStyle: llvm, IndentWidth: 4}"', '-assume-filename', '"%:p"' ],
    \ 'stdin': 1,
    \ }
]])

--
vim.cmd([[
let g:neoformat_javascript_prettier = {
    \ 'exe': 'prettier',
    \ 'args': ['--tab-width 4', '--stdin-filepath', '"%:p"'],
    \ 'stdin': 1,
    \ 'try_node_exe': 1,
    \ }
]])
--
vim.cmd([[
let g:neoformat_javascriptreact_prettier = {
    \ 'exe': 'prettier',
    \ 'args': ['--tab-width 4', '--stdin-filepath', '"%:p"'],
    \ 'stdin': 1,
    \ 'try_node_exe': 1,
    \ }
]])

vim.cmd([[
let g:neoformat_lua_stylua = {
    \ 'exe': 'stylua',
    \ 'args': ['--indent-width', '4', '--indent-type', 'Spaces', '--search-parent-directories', '--stdin-filepath', '"%:p"', '--', '-'],
    \ 'stdin': 1,
    \ }
]])

vim.g.neoformat_enabled_python = { "black" }
vim.g.neoformat_enabled_javascript = { "prettier" }
vim.g.neoformat_enabled_javascriptreact = { "prettier" }
vim.g.neoformat_enabled_c = { "clangformat" }
vim.g.neoformat_enabled_cpp = { "clangformat" }
vim.g.neoformat_enabled_lua = { "stylua" }

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
