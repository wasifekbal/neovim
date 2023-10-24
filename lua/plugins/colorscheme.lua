-- local config = function()
--     require('nightfox').setup({
--         options = {
--             -- Compiled file's destination location
--             compile_path = vim.fn.stdpath("cache") .. "/nightfox",
--             compile_file_suffix = "_compiled", -- Compiled file suffix
--             transparent = true,     -- Disable setting background
--             terminal_colors = true,  -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
--             dim_inactive = false,    -- Non focused panes set to alternative background
--             module_default = true,   -- Default enable value for modules
--             colorblind = {
--                 enable = false,        -- Enable colorblind support
--                 simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
--                 severity = {
--                     protan = 0,          -- Severity [0,1] for protan (red)
--                     deutan = 0,          -- Severity [0,1] for deutan (green)
--                     tritan = 0,          -- Severity [0,1] for tritan (blue)
--                 },
--             },
--             styles = {               -- Style to be applied to different syntax groups
--                 comments = "italic",     -- Value is any valid attr-list value `:help attr-list`
--                 conditionals = "NONE",
--                 constants = "NONE",
--                 functions = "italic",
--                 keywords = "NONE",
--                 numbers = "NONE",
--                 operators = "NONE",
--                 strings = "NONE",
--                 types = "NONE",
--                 variables = "NONE",
--             },
--             inverse = {             -- Inverse highlight for different types
--                 match_paren = false,
--                 visual = false,
--                 search = false,
--             },
--             modules = {             -- List of various plugins and additional options
--                 -- ...
--             },
--         },
--         palettes = {},
--         specs = {},
--         groups = {},
--     })
--     -- setup must be called before loading
--     vim.cmd("colorscheme nightfox")
-- end

local config = function()
    require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = {
            light = "latte",
            dark = "mocha",
        },
        compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
        transparent_background = true,
        term_colors = true,
        dim_inactive = {
            enabled = false,
            shade = "dark",
            percentage = 0.15,
        },
        styles = {
            comments = { "italic" },
            conditionals = { "italic" },
            loops = {},
            functions = { "italic" },
            keywords = {},
            strings = {},
            variables = {},
            numbers = {},
            booleans = {},
            properties = {},
            types = {},
            operators = {},
        },
        color_overrides = {},
        custom_highlights = {},
        integrations = {
            alpha = true,
            cmp = true,
            gitsigns = true,
            nvimtree = true,
            telescope = true,
            treesitter = true,
            treesitter_context = true,
            mason = true,
        },
    })
    vim.cmd("colorscheme catppuccin")
    vim.cmd([[highlight LineNr guifg=#e0a0a0]])
end

return {
    -- "EdenEast/nightfox.nvim",
    "catppuccin/nvim",
    lazy = false,
    priority = 999,
    config = config
}
