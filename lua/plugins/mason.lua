return {
    "williamboman/mason.nvim",
    cmd = "Mason",
    event = "BufReadPre",
    config = {
        ui = {
            border="rounded",
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗",
            },
        },
    }
}
