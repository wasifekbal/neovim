local lsp = require("lsp-zero").preset({})

local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
    return
end

local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then
    return
end

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
    return
end

luasnip.filetype_extend("javascript", { "html" })
luasnip.filetype_extend("typescript", { "html" })
luasnip.filetype_extend("javascriptreact", { "html" })
luasnip.filetype_extend("typescriptreact", { "html" })

require("luasnip/loaders/from_vscode").lazy_load()

local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1)),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1)),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete()),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
})

--[[ lsp.set_preferences({ ]]
--[[     sign_icons = {} ]]
--[[ }) ]]

local kind_icons = {
    Text = "",
    Method = "󰊕",
    Function = "󰊕",
    Constructor = "",
    Field = "",
    Variable = "󰫧",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
}

lsp.setup_nvim_cmp({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = cmp_mappings,
    sources = {
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            -- Kind icons
            vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
            -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
            vim_item.menu = ({
                nvim_lsp = "LSP",
                nvim_lua = "nvim_lua",
                luasnip = "Snip",
                buffer = "Buf",
                path = "Path",
            })[entry.source.name]
            return vim_item
        end,
    },
})

mason.setup({
    ui = {
        border = "rounded",
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

lsp.ensure_installed({
    "bashls",
    "lua_ls",
    "jsonls",
    "html",
    "cssls",
    --[[ "clangd", ]]
    --[[ "jdtls", ]]
    "pyright",
    "tsserver",
    --[[ "tailwindcss", ]]
})

--[[ mason_lspconfig.setup({ ]]
--[[     ensure_installed = { ]]
--[[         "bashls", ]]
--[[         "lua_ls", ]]
--[[         "jsonls", ]]
--[[         "html", ]]
--[[         "cssls", ]]
--[[         "clangd", ]]
--[[         "jdtls", ]]
--[[         "pyright", ]]
--[[         "tsserver", ]]
--[[         "tailwindcss", ]]
--[[     }, ]]
--[[     automatic_installation = true, ]]
--[[ }) ]]

local function lsp_highlight_document(client)
    -- Set autocommands conditional on server_capabilities
    if client.server_capabilities.documentHighlightProvider then
        vim.cmd([[
                augroup lsp_document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
                augroup END
                ]])
        -- Below line formats a file on buffer write
        --[[ vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()") ]]
    end
end

local function lsp_keymaps(bufnr)
    local opts = { noremap = true, silent = true }
    --[[ vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts) ]]
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", '<cmd>lua vim.diagnostic.open_float({border="rounded"})<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "v", "<leader>ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
end

lsp.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_keymaps(bufnr)
    lsp_highlight_document(client)
    --[[ lsp.default_keymaps({buffer = bufnr}) ]]
end)

-- (Optional) Configure lua language server for neovim
require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
