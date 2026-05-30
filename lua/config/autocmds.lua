-- Create an augroup wrapper so autocmds don't duplicate on configuration reloads
local function augroup(name)
    return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- Fixes Session Restore Syntax Highlighting
-- Ensures that buffers re-attach to treesitter and LSP accurately after a session load
vim.api.nvim_create_autocmd("SessionLoadPost", {
    group = augroup("session_restore_fix"),
    callback = function()
        vim.schedule(function()
            if vim.bo.buftype == "" then
                vim.cmd("edit!")
            end
            pcall(function()
                require("nvim-treesitter.configs").setup_buffer()
            end)
        end)
    end,
})

-- FILETYPE ASSOCIATIONS (Migrated from options.lua)
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    group = augroup("custom_filetypes"),
    pattern = "*.ssh.conf",
    command = "setfiletype sshconfig",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    group = augroup("custom_filetypes"),
    pattern = "*.cron",
    command = "setfiletype crontab",
})

-- QUALITY OF LIFE: Highlight Text on Yank (Copy)
-- Briefly highlights the text block you just yanked (super satisfying UI feedback)
vim.api.nvim_create_autocmd("TextYankPost", {
    group = augroup("highlight_yank"),
    callback = function()
        vim.highlight.on_yank({ hisgrup = "IncSearch", timeout = 150 })
    end,
})

-- QUALITY OF LIFE: Clean Trailing Whitespace on Save
-- Keeps your files clean by stripping unwanted trailing spaces automatically
vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup("clean_whitespace"),
    pattern = "*",
    callback = function()
        local save_cursor = vim.fn.getpos(".")
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.setpos(".", save_cursor)
    end,
})

-- QUALITY OF LIFE: Auto-Resize Splits on Window Resize
-- If you resize your terminal window, your vertical/horizontal splits will balance out automatically
vim.api.nvim_create_autocmd("VimResized", {
    group = augroup("resize_splits"),
    callback = function()
        local current_tab = vim.api.nvim_get_current_tabpage()
        vim.cmd("tabdo wincmd =")
        vim.api.nvim_set_current_tabpage(current_tab)
    end,
})
