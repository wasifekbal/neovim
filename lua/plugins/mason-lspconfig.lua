local opts = {
    ensure_installed = {
        "bashls",
        "lua_ls",
        "pyright",
        "tsserver",
        "jsonls",
        "cssls",
        "html",
        "tailwindcss",
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
