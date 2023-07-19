--[[ require("nvim-treesitter.install").prefer_git = true ]]
local treesitter_config = require("nvim-treesitter.configs")

treesitter_config.setup({
    -- ensure_installed = "maintained",
    ensure_installed = { "c", "cpp", "python", "javascript", "html", "css", "json", "java", "typescript", "tsx", "vue" },
    sync_install = false,
    ignore_install = { "" }, -- List of parsers to ignore installing
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "lua" }, -- list of language that will be disabled
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
    indent = { enable = true, disable = { "yaml" } },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    autotag = {
        enable = true,
    }
})
