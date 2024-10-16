local function config()
    local mocha = require("catppuccin.palettes").get_palette("mocha")
    local catppuccin_highlights = require("catppuccin.groups.integrations.bufferline").get({
        styles = { "italic", "bold" },
        custom = {
            mocha = {
                buffer_selected = {
                    fg = mocha.text,
                    bg = mocha.surface0,
                    italic = true,
                },
                background = {
                    fg = mocha.text,
                    italic = true,
                },
                fill = {
                    fg = mocha.text,
                    -- bg = "#000000"
                },
            },
        },
    })
    require("bufferline").setup({
        highlights = catppuccin_highlights,
        options = {
            update_in_insert = true,
            mode = "", -- set to "tabs" to only show tabpages instead
            numbers = "none", -- "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
            close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
            right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
            left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
            middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
            -- NOTE: this plugin is designed with this icon in mind,
            -- and so changing this is NOT recommended, this is intended
            -- as an escape hatch for people who cannot bear it for whatever reason
            indicator = {
                --[[ icon = '▎', -- this should be omitted if indicator style is not 'icon' ]]
                --[[ style = 'icon' | 'underline' | 'none', ]]
                style = "icon",
            },
            buffer_close_icon = "󱎘",
            modified_icon = "●",
            close_icon = "",
            left_trunc_marker = "",
            right_trunc_marker = "",
            --- name_formatter can be used to change the buffer's label in the bufferline.
            --- Please note some names can/will break the
            --- bufferline so use this at your discretion knowing that it has
            --- some limitations that will *NOT* be fixed.
            -- name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
            -- remove extension from markdown files for example
            -- if buf.name:match('%.md') then
            --   return vim.fn.fnamemodify(buf.name, ':t:r')
            -- end
            --     local name = ""
            --     local relative_path = vim.fn.fnamemodify(buf.path, ":.")
            --     local delimiter = "/"
            --
            --     for match in (relative_path .. delimiter):gmatch("(.-)" .. delimiter) do
            --         name = name .. match:sub(1, 1) .. "/"
            --     end
            --
            --     return (name:sub(1, -3) .. buf.name)
            -- end,
            max_name_length = 30,
            max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
            tab_size = 20,
            diagnostics = "nvim_lsp",
            --[[ diagnostics_update_in_insert = true, ]]
            -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
            -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
            --   return "("..count..")"
            -- end,
            -- NOTE: this will be called a lot so don't do any heavy processing here
            -- custom_filter = function(buf_number, buf_numbers)
            --   -- filter out filetypes you don't want to see
            --   if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
            --     return true
            --   end
            --   -- filter out by buffer name
            --   if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
            --     return true
            --   end
            --   -- filter out based on arbitrary rules
            --   -- e.g. filter out vim wiki buffer from tabline in your work repo
            --   if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
            --     return true
            --   end
            --   -- filter out by it's index number in list (don't show first buffer)
            --   if buf_numbers[1] ~= buf_number then
            --     return true
            --   end
            -- end,
            offsets = { { filetype = "NvimTree", text = "File Explorer" } }, -- {{filetype = "NvimTree", text = "File Explorer" | function , text_align = "left" | "center" | "right"}},
            color_icons = true, -- whether or not to add the filetype icon highlights
            show_buffer_icons = true, -- disable filetype icons for buffers
            show_buffer_close_icons = true,
            --[[ show_buffer_default_icon = true, -- whether or not an unrecognised filetype should show a default icon ]]
            show_close_icon = true,
            show_tab_indicators = true,
            persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
            -- can also be a table containing 2 custom separators
            -- [focused and unfocused]. eg: { '|', '|' }
            separator_style = "thin", -- "slant" | "thick" | "thin" | { 'any', 'any' },
            enforce_regular_tabs = false, -- false | true,
            always_show_bufferline = true,
            -- sort_by = 'insert_after_current' |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
            --   -- add custom logic
            --   return buffer_a.modified > buffer_b.modified
            -- end
        },
        -- highlights = {
        --[[ separator = { ]]
        --[[     fg = "#cdd6f4", ]]
        --[[ }, ]]
        --[[ separator_selected = { ]]
        --[[     fg = "#fab387", ]]
        --[[ }, ]]
        -- background = {
        --     fg = '#bac2de',
        --     bg = "#1e1e2e"
        -- },
        -- buffer_selected = {
        --     fg = '#74c7ec',
        --     italic = true,
        -- },
        --[[ fill = { ]]
        --[[     bg = '#073642' ]]
        --[[ }, ]]
        -- },
    })
end

return {
    "akinsho/bufferline.nvim",
    lazy = false,
    version = "*",
    config = config,
    dependencies = {
        "catppuccin/nvim",
    },
}

