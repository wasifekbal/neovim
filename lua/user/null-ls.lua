local null_ls = require("null-ls")

null_ls.setup({
    debug = false,
    sources = {
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.code_actions.eslint_d,
    },
})
