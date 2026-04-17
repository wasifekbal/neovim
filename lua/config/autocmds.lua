-- Fix for session restore syntax highlighting issue
-- Use vim.schedule to ensure it runs after the session is fully loaded and plugins are initialized
vim.api.nvim_create_autocmd("SessionLoadPost", {
    callback = function()
        vim.schedule(function()
            -- Reload the buffer to force everything to re-attach
            if vim.bo.buftype == "" then
                vim.cmd("edit!")
            end
            -- Force treesitter attach if available
            pcall(function()
                require("nvim-treesitter.configs").setup_buffer()
            end)
        end)
    end,
})
