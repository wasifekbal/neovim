local lspconfig = require("lspconfig")

local on_attach = require("util.lsp").on_attach

local cap = vim.lsp.protocol.make_client_capabilities()
cap.offsetEncoding = { "utf-16" }
local capabilities = require("cmp_nvim_lsp").default_capabilities(cap)


-- local lua_options = require("user.mason.server_settings.lua_ls")
lspconfig.lua_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                },
            },
        },
    }
    -- settings = require("user.mason.server_settings.lua_ls").settings,
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
    on_attach = on_attach,
    capabilities = capabilities,
    commands = {
        OrganizeImports = {
            organize_imports,
            description = "Organize Imports",
        },
    },
})

-- lspconfig.tailwindcss.setup({
--     on_attach = on_attach,
--     capabilities = capabilities,
-- })

-- local jsonls_options = require("user.mason.server_settings.jsonls")
lspconfig.jsonls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    -- settings = jsonls_options.settings,
    -- setup = jsonls_options.setup,
})

-- local pyright_options = require("user.mason.server_settings.pyright")
lspconfig.pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "off",
                reportOptionalSubscript = "off",
                reportOptionalMemberAccess = "off",
            },
        pyright = {
                disableOrganizeImports = true
            }
        },
    }
    -- settings = pyright_options.settings,
})

lspconfig.bashls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.html.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.cssls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.clangd.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.jdtls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
lspconfig.volar.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
