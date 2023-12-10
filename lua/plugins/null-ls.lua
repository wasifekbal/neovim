local function config()
    local null_ls = require("null-ls")
    null_ls.setup({
        debug = false,
        sources = {
            -- Diagnostics
            null_ls.builtins.diagnostics.eslint_d,
            -- null_ls.builtins.diagnostics.ruff,

            -- Code Actions
            null_ls.builtins.code_actions.eslint_d,

            -- Completions
        },
    })
end

return {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    config = config,
}
