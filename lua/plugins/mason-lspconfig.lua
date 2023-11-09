local opts = {
    ensure_installed = {
        "bashls",
        "lua_ls",
        "pyright",
        "tsserver",
        "jsonls",
        -- "cssls",
        --[[ "html", ]]
        --[[ "clangd", ]]
        --[[ "jdtls", ]]
        --[[ "tailwindcss", ]]
    },
    automatic_installation = true,
}


return {
    "williamboman/mason-lspconfig.nvim",
    opts = opts,
    event = "BufReadPre",
    dependencies = "williamboman/mason.nvim"
}
