local config = function()
    require("nvim-treesitter.install").prefer_git = true
    require("nvim-treesitter.configs").setup({
        indent = { enable = true, disable = { "yaml" } },
        ensure_installed = {
            "lua",
            "markdown",
            "markdown_inline",
            "python",
            "bash",
        },
        auto_install = true,
        sync_install = true,
        ignore_install = { "" }, -- List of parsers to ignore installing
        highlight = {
            enable = true, -- false will disable the whole extension
            -- disable = { "lua" }, -- list of language that will be disabled
            additional_vim_regex_highlighting = true,
        },
        rainbow = {
            enable = true,
            -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
            extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
            max_file_lines = nil, -- Do not enable for files with more than n lines, int
            -- colors = {}, -- table of hex strings
            -- termcolors = {} -- table of colour name strings
        },
        autotag = {
            enable = true,
        },
    })
    require("ts_context_commentstring").setup({
        enable_autocmd = false,
        languages = {
            python = "# %s",
        },
    })
end

return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    config = config,
}
