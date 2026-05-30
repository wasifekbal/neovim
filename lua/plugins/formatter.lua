local function config()
    require("conform").setup({
        formatters_by_ft = {
            lua = { "stylua" },

            python = {
                "ruff_organize_imports",
                "ruff_format",
            },

            javascript = { "prettier" },
            javascriptreact = { "prettier" },
            typescript = { "prettier" },
            typescriptreact = { "prettier" },

            vue = { "prettier" },

            json = { "prettier" },

            css = { "prettier" },
            html = { "prettier" },
            markdown = { "prettier" },

            bash = { "shfmt" },
            sh = { "shfmt" },

            yaml = { "yamlfmt" },

            java = { "clang-format" },
            c = { "clang-format" },
            cpp = { "clang-format" },
        },

        formatters = {
            stylua = {
                prepend_args = {
                    "--indent-width",
                    "4",
                    "--indent-type",
                    "Spaces",
                },
            },

            prettier = {
                prepend_args = {
                    "--tab-width",
                    "4",
                    "--arrow-parens",
                    "always",
                    "--trailing-comma",
                    "es5",
                },
            },

            shfmt = {
                prepend_args = {
                    "-i",
                    "4",
                },
            },
        },

        --[[ format_on_save = { ]]
        --[[     timeout_ms = 3000, ]]
        --[[     lsp_fallback = true, ]]
        --[[ }, ]]
    })
end

return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    config = config,
}
