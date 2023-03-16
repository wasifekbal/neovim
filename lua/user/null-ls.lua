local null_ls = require("null-ls")

null_ls.setup({
    debug = false,
    sources = {
        -- Diagnostics
        null_ls.builtins.diagnostics.eslint_d,

        -- Code Actions
        null_ls.builtins.code_actions.eslint_d,

        -- Completions
    },
})
