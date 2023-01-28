-- tokyonight colorscheme
--[[ vim.g.tokyonight_style = "moon" -- "storm", "moon", "night", "day" ]]
--[[ vim.g.tokyonight_terminal_colors = true ]]
--[[ vim.g.tokyonight_italic_comments = true ]]
--[[ vim.g.tokyonight_italic_keywords = true ]]
--[[ vim.g.tokyonight_italic_functions = true ]]
--[[ vim.g.tokyonight_italic_variables = true ]]
--[[ vim.g.tokyonight_transparent = false ]]
--[[ vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" } ]]
--[[ vim.g.tokyonight_transparent_sidebar = true ]]
--[[ vim.g.tokyonight_dark_float = true ]]
--[[ vim.g.tokyonight_colors = { hint = "orange", error = "#d30e39" } ]]
--[[ vim.g.tokyonight_lualine_bold = false ]]

-- dracula colorscheme
-- show the '~' characters after the end of buffers
--[[ vim.g.dracula_show_end_of_buffer = true ]]
-- use transparent background
--[[ vim.g.dracula_transparent_bg = true ]]
-- set custom lualine background color
-- vim.g.dracula_lualine_bg_color = "#44475a"
-- set italic comment
--[[ vim.g.dracula_italic_comment = true ]]

-- everforest colorscheme
--[[ vim.g.everforest_background = "soft" -- 'hard'`, `'medium'`, `'soft' ]]
--[[ vim.g.everforest_better_performance = 1 ]]
--[[ vim.g.everforest_enable_italic = 1 ]]
--[[ vim.g.everforest_transparent_background = 1 -- `0`, `1`, `2` ]]

--[[ -- Default gruvbox options: ]]
--[[ require("gruvbox").setup({ ]]
--[[     undercurl = true, ]]
--[[     underline = true, ]]
--[[     bold = false, ]]
--[[     italic = true, ]]
--[[     strikethrough = true, ]]
--[[     invert_selection = false, ]]
--[[     invert_signs = false, ]]
--[[     invert_tabline = false, ]]
--[[     invert_intend_guides = false, ]]
--[[     inverse = true, -- invert background for search, diffs, statuslines and errors ]]
--[[     contrast = "soft", -- can be "hard", "soft" or empty string ]]
--[[     palette_overrides = {}, ]]
--[[     overrides = {}, ]]
--[[     dim_inactive = false, ]]
--[[     transparent_mode = true, ]]
--[[ }) ]]

-- catppuccin options
require("catppuccin").setup({
    flavour = "mocha",
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
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        treesitter = true,
    },
})

local colorscheme = "catppuccin"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end
