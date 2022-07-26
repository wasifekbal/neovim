-- tokyonight colorscheme
vim.g.tokyonight_style = "night" -- storm", "night", "day"
vim.g.tokyonight_transparent = false
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
vim.g.tokyonight_dark_float = true
vim.g.tokyonight_colors = { hint = "orange", error = "#d30e39" }
vim.g.tokyonight_transparent_sidebar = false

-- tokyonight colorscheme
-- vim.g.transparent_background = false

-- dracula colorscheme
-- show the '~' characters after the end of buffers
vim.g.dracula_show_end_of_buffer = true
-- use transparent background
vim.g.dracula_transparent_bg = true
-- set custom lualine background color
-- vim.g.dracula_lualine_bg_color = "#44475a"
-- set italic comment
vim.g.dracula_italic_comment = true


local colorscheme = "tokyonight"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end


