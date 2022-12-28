local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
	return
end

local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then
	return
end

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

mason_lspconfig.setup({
    ensure_installed = { "sumneko_lua", "pyright", "tsserver", "tailwindcss", "pyright" },
    automatic_installation = true,
})

require("user.mason.handlers").setup()

require("user.mason.server_settings")
