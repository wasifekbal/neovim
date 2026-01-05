return {
    "ojroques/nvim-osc52",
    event = "VeryLazy",
    config = function()
        require("osc52").setup({
            max_length = 0,      -- no limit
            silent = false,      -- notify on copy
            trim = false,        -- don't trim whitespace
        })

        local function copy()
            require("osc52").copy_visual()
        end

        local function copy_line()
            require("osc52").copy_line()
        end

        -- Visual mode: copy selection
        vim.keymap.set("v", "<leader>y", copy, { desc = "OSC52 copy selection" })

        -- Normal mode: copy current line
        vim.keymap.set("n", "<leader>yy", copy_line, { desc = "OSC52 copy line" })
    end,
}
