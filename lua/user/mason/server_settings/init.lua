local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
    return
end

local handlers_ok, handlers = pcall(require, "user.mason.handlers")
if not handlers_ok then
    print("!! something went wrong while requiring handlers !!")
    return
end

local lua_options = require("user.mason.server_settings.lua_ls")
lspconfig.lua_ls.setup({
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
    settings = lua_options.settings,
})

local function organize_imports()
    local params = {
        command = "_typescript.organizeImports",
        arguments = { vim.api.nvim_buf_get_name(0) },
        title = "",
    }
    vim.lsp.buf.execute_command(params)
end

lspconfig.tsserver.setup({
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
    commands = {
        OrganizeImports = {
            organize_imports,
            description = "Organize Imports",
        },
    },
})

lspconfig.tailwindcss.setup({
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
})

local jsonls_options = require("user.mason.server_settings.jsonls")
lspconfig.jsonls.setup({
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
    settings = jsonls_options.settings,
    setup = jsonls_options.setup,
})

local pyright_options = require("user.mason.server_settings.pyright")
lspconfig.pyright.setup({
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
    settings = pyright_options.settings,
})

lspconfig.bashls.setup({
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
})

lspconfig.html.setup({
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
})

lspconfig.cssls.setup({
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
})

lspconfig.clangd.setup({
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
})

lspconfig.jdtls.setup({
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
})
lspconfig.volar.setup({
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
})
