local opts = {
    ensure_installed = {
        "bashls",
        "lua_ls",
        "pyright",
        -- "cssls",
        --[[ "jsonls", ]]
        --[[ "html", ]]
        --[[ "clangd", ]]
        --[[ "jdtls", ]]
        --[[ "tsserver", ]]
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
