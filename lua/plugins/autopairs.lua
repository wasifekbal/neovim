local function config()
    require("nvim-autopairs").setup({
        check_ts = true,
        ts_config = {
            lua = { "string", "source" },
            javascript = { "string", "template_string" },
            java = false,
        },
        disable_filetype = { "TelescopePrompt", "spectre_panel", "vim" },
        fast_wrap = {
            map = "<M-e>",
            chars = { "{", "[", "(", '"', "'" },
            pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
            offset = 0, -- Offset from pattern match
            end_key = "$",
            keys = "qwertyuiopzxcvbnmasdfghjkl",
            check_comma = true,
            highlight = "PmenuSel",
            highlight_grey = "LineNr",
        },
        enable_check_bracket_line = false,
    })
    require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done({ map_char = { tex = "" } }))
end

return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = config,
    dependencies = {
        "hrsh7th/nvim-cmp",
        event = "BufReadPre"
    },
}
