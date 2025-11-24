local opts = {
    ensure_installed = {
        "bashls",
        "lua_ls",
        "pyright",
        "ts_ls",
        "jsonls",
        "cssls",
        "html",
        "tailwindcss",
        "ruff"
        --[[ "clangd", ]]
        --[[ "jdtls", ]]
    },
    automatic_installation = true,
}


return {
    "williamboman/mason-lspconfig.nvim",
    opts = opts,
    event = "BufReadPre",
    dependencies = "williamboman/mason.nvim"
}
