return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
        vim.g.mkdp_filetypes = { "markdown" }
        vim.g.mkdp_auto_close = 0
        vim.g.mkdp_auto_start = 0
        vim.g.mkdp_open_to_the_world = 1
    end,
    ft = { "markdown" },
}
