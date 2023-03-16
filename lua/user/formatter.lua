-- Utilities for creating configurations
local util = require("formatter.util")

--[[ custom prettier function for 4 width indent ]]
local prettier_custom = function(parser)
    if not parser then
        return {
            exe = "prettier",
            args = {
                "--tab-width 4",
                "--stdin-filepath",
                util.escape_path(util.get_current_buffer_file_path()),
            },
            stdin = true,
            try_node_modules = true,
        }
    end

    return {
        exe = "prettier",
        args = {
            "--tab-width 4",
            "--stdin-filepath",
            util.escape_path(util.get_current_buffer_file_path()),
            "--parser",
            parser,
        },
        stdin = true,
        try_node_modules = true,
    }
end

--[[ custom clang-format function for 4 width indent ]]
---@diagnostic disable-next-line: unused-local, unused-function
local custom_clangformat = function()
    return {
        exe = "clang-format",
        args = {
            '-style="{BasedOnStyle: llvm, IndentWidth: 4}"',
            "-assume-filename",
            util.escape_path(util.get_current_buffer_file_name()),
        },
        stdin = true,
        try_node_modules = true,
    }
end

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
    -- Enable or disable logging
    logging = false,
    -- Set the log level
    log_level = vim.log.levels.WARN,
    -- All formatter configurations are opt-in

    filetype = {
        -- Formatter configurations for filetype "lua" go here
        -- and will be executed in order
        lua = {
            function()
                return {
                    exe = "stylua",
                    args = {
                        "--indent-width 4",
                        "--indent-type Spaces",
                        "--search-parent-directories",
                        "--stdin-filepath",
                        util.escape_path(util.get_current_buffer_file_path()),
                        "--",
                        "-",
                    },
                    stdin = true,
                }
            end,
        },

        javascript = {
            --[[ require("formatter.filetypes.javascript").prettier, ]]
            require("formatter.defaults.prettier"),
        },

        javascriptreact = {
            --[[ require("formatter.filetypes.javascriptreact").prettier, ]]
            require("formatter.defaults.prettier"),
        },

        typescript = {
            --[[ require("formatter.filetypes.typescript")typettier, ]]
            require("formatter.defaults.prettier"),
        },

        typescriptreact = {
            --[[ require("formatter.filetypes.typescriptreact").prettier, ]]
            require("formatter.defaults.prettier"),
        },

        css = {
            --[[ require("formatter.defaults.prettier"), ]]
            prettier_custom,
        },

        html = {
            require("formatter.defaults.prettier"),
        },

        markdown = {
            require("formatter.defaults.prettier"),
        },

        python = {
            require("formatter.filetypes.python").black,
        },

        sh = {
            require("formatter.filetypes.sh").shfmt,
        },

        yaml = {
            require("formatter.filetypes.yaml").yamlfmt,
        },

        java = {
            require("formatter.defaults.clangformat"),
        },

        c = {
            require("formatter.defaults.clangformat"),
        },

        cpp = {
            require("formatter.defaults.clangformat"),
        },
        -- any filetype
        ["*"] = {
            -- "formatter.filetypes.any" defines default configurations for any
            -- filetype
            require("formatter.filetypes.any").remove_trailing_whitespace,
        },
    },
})
