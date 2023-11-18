return {
    "echasnovski/mini.nvim",
    version = false,
    event = "BufReadPre",
    config = function()
        -- require("mini.animate").setup({
        --     cursor = {
        --         enable = true,
        --     },
        --     scroll = {
        --         enable = false,
        --     },
        --     resize = {
        --         enable = false,
        --     },
        --     open = {
        --         enable = false,
        --     },
        --     close = {
        --         enable = false,
        --     },
        -- })
        -- require("mini.indentscope").setup({})
        require("mini.surround").setup()
    end,
}
