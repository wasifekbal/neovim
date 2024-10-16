local M = {}

M.signs = {
    { name = "DiagnosticSignError",text = "✘" },
    { name = "DiagnosticSignWarn", text = "▲" },
    { name = "DiagnosticSignHint", text = "⚑" },
    { name = "DiagnosticSignInfo", text = "»" },
}

-- Set autocommands conditional on server_capabilities
local function lsp_highlight_document(client)
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

local function lsp_keymaps(client, bufnr)
    local opts = { noremap = true, silent = true }
    --[[ vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts) ]]
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", '<cmd>lua vim.diagnostic.open_float({border="rounded"})<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ga", "<cmd>Lspsaga code_action<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "v", "<leader>ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)

    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ol", ":Lspsaga outline<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>sf", ":Lspsaga finder<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ic", ":Lspsaga incoming_calls<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>oc", ":Lspsaga outgoing_calls<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>bd", ":Lspsaga show_buf_diagnostics ++float<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>wd", ":Lspsaga show_workspace_diagnostics ++float<CR>", opts)

    if client.name == "pyright" then
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>oi", "<cmd>PyrightOrganizeImports<CR>", opts)
    elseif client.name == "ts_ls" then
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>oi", "<cmd>OrganizeImports<CR>", opts)
    end
end

---@diagnostic disable-next-line: unused-local
M.on_attach = function(client, bufnr)
    -- enable keybinds for buffers with lsp server.

    --[[ if (client.name == "tsserver") or (client.name == "clangd") then ]]
    --[[ client.server_capabilities.document_formatting = false ]]
    --[[ client.server_capabilities.documentFormattingProvider = false ]]
    --[[ end ]]
    lsp_keymaps(client, bufnr)
    lsp_highlight_document(client)
end

return M

