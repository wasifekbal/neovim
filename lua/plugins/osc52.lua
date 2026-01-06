return {
    "ojroques/nvim-osc52",
    event = "VeryLazy",
    config = function()
        local osc52 = require("osc52")

        osc52.setup({
            max_length = 0,
            silent = false,
            trim = false,
        })

        -- Copy to BOTH:
        -- 1. System clipboard (+ register)
        -- 2. OSC52 (for SSH)
        local function copy_operator(type)
            -- Copy to system clipboard
            vim.cmd('normal! "+y')

            -- Copy via OSC52
            if type == "line" then
                osc52.copy_line()
            elseif type == "visual" then
                osc52.copy_visual()
            else
                osc52.copy_operator(type)
            end
        end

        -- Normal mode: yy / y motions
        vim.keymap.set("n", "y", function()
            return copy_operator
        end, { expr = true })

        -- Visual mode: y
        vim.keymap.set("v", "y", function()
            copy_operator("visual")
        end)
    end,
}
