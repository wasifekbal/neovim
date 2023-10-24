local config = function()
    local hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end

    local diff = {
        "diff",
        colored = false,
        symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
        cond = hide_in_width,
    }

    require("lualine").setup({
        options = {
            icons_enabled = true,
            theme = "auto", -- 'auto'
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = {
                "NvimTree",
                "dashboard",
                "Outline",
                statusline = {},
                winbar = {},
            },
            always_divide_middle = true,
            globalstatus = true, -- global statusline for all buffers
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
            },
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", diff, "diagnostics" },
            --[[ lualine_c = {'filename'}, ]]
            lualine_c = {
                {
                    "filename",
                    file_status = true, -- displays file status (readonly status, modified status)
                    path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
                },
            },
            lualine_x = {
                {
                    "diagnostics",
                    sources = { "nvim_diagnostic" },
                    symbols = { error = "", warn = "", info = "", hint = "" },
                },
                "encoding",
                "filetype",
            }, -- {'encoding', 'fileformat', 'filetype'}
            lualine_y = { "progress" },
            lualine_z = { "location" },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = { { "filename", path = 1 } },
            lualine_c = { "location" },
            lualine_x = {},
            lualine_y = {},
            lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {},
    })
end

return {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    config = config,
}
