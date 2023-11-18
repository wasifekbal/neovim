-- return {
--   "jiaoshijie/undotree",
--   dependencies = "nvim-lua/plenary.nvim",
--   config = true,
--   keys = { -- load the plugin only when using it's keybinding:
--     { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
--   },
-- }

return {
    "mbbill/undotree",
    -- dependencies = "nvim-lua/plenary.nvim",
    config = function() end,
    keys = { -- load the plugin only when using it's keybinding:
        { "<leader>u", "<cmd>UndotreeToggle<cr><cmd>UndotreeFocus<cr>" },
    },
}
