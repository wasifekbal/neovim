return {
    "windwp/nvim-ts-autotag",
    lazy = false,
    --[[ config = {}, ]]
    config = function()
        require('nvim-ts-autotag').setup({})
    end,
    dependencies = {
        "nvim-treesitter/nvim-treesitter"
    },
}

