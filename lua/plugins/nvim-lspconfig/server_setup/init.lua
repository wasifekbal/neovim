local lspconfig = require("lspconfig")
local on_attach = require("util.lsp").on_attach
local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities
local capabilities = cmp_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.offsetEncoding = { "utf-16" }

local function setup_lsp(server, opts)
    if not lspconfig[server] then
        vim.notify("LSP server not installed: " .. server, vim.log.levels.WARN)
        return
    end
    lspconfig[server].setup(opts or {})
end

-- ==========================
-- LSP SERVERS
-- ==========================

-- LUA
setup_lsp("lua_ls", {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                },
            },
        },
    },
})

-- TYPESCRIPT
local function organize_imports()
    local params = {
        command = "_typescript.organizeImports",
        arguments = { vim.api.nvim_buf_get_name(0) },
        title = "",
    }
    vim.lsp.buf.execute_command(params)
end

setup_lsp("ts_ls", {
    on_attach = on_attach,
    capabilities = capabilities,
    commands = {
        OrganizeImports = {
            organize_imports,
            description = "Organize Imports",
        },
    },
})

-- GO
setup_lsp("gopls", {})

-- JSON
setup_lsp("jsonls", {
    on_attach = on_attach,
    capabilities = capabilities,
})

-- PYTHON
setup_lsp("pyright", {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "off",
                reportOptionalSubscript = "off",
                reportOptionalMemberAccess = "off",
            },
            pyright = { disableOrganizeImports = true },
        },
    },
})

-- RUFF (Python linter)
setup_lsp("ruff", {
    on_attach = on_attach,
    init_options = { settings = { args = {} } },
})

-- BASH
setup_lsp("bashls", { on_attach = on_attach, capabilities = capabilities })

-- HTML
setup_lsp("html", { on_attach = on_attach, capabilities = capabilities })

-- CSS
setup_lsp("cssls", { on_attach = on_attach, capabilities = capabilities })

-- C / C++
setup_lsp("clangd", { on_attach = on_attach, capabilities = capabilities })

-- JAVA
setup_lsp("jdtls", { on_attach = on_attach, capabilities = capabilities })

-- VUE / VOLAR
setup_lsp("volar", { on_attach = on_attach, capabilities = capabilities })
