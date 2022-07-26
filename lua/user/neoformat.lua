vim.g.neoformat_enabled_python = {'autopep8'}
vim.g.neoformat_enabled_javascript = {'prettier'}

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
