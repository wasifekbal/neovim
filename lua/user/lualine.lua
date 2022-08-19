local status_ok, lualine_config = pcall(require, "lualine")
if not status_ok then
  print("problem in lualine config")
  return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = hide_in_width
}
-- -- cool function for progress
-- local progress = function()
-- 	local current_line = vim.fn.line(".")
-- 	local total_lines = vim.fn.line("$")
-- 	local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
-- 	local line_ratio = current_line / total_lines
-- 	local index = math.ceil(line_ratio * #chars)
-- 	return chars[index]
-- end

lualine_config.setup {
  options = {
    icons_enabled = true,
    theme = "tokyonight", -- 'auto'
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      "NvimTree", "dashboard", "Outline",
      statusline = {},
      winbar = {},
    },
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', diff, 'diagnostics'},
    -- lualine_c = {'filename'},
    lualine_c = {{
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 0 -- 0 = just filename, 1 = relative path, 2 = absolute path
    }},
    lualine_x = {
      { 'diagnostics', sources = { "nvim_diagnostic" }, symbols = { error = '', warn = '', info = '', hint = '' } },
      'encoding', 'filetype'
    }, -- {'encoding', 'fileformat', 'filetype'}
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
