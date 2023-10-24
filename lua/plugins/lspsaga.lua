return {
    'nvimdev/lspsaga.nvim',
    event = "BufReadPre",
    config = function()
        require('lspsaga').setup({})
    end,
}
