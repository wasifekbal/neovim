require("user.plugins")

require("user.impatient")
require("user.keymaps")
require("user.colorscheme")
require("user.options")

require("user.cmp")
require("user.mason")
require("user.null-ls")
require("user.formatter")

require("user.telescope")
require("user.treesitter")
require("user.bufferline")
require("user.nvimtree")
require("user.lualine")

require("user.sessions")
require("user.autopairs")
require("user.ts-autotag")
require("user.comment")
require("user.indentline")

--[[ require('user/coderunner') ]]
require("user.alpha")
require("user.gitsigns")
require("user.colorizer")
--[[ require('user/toggleterm') ]]
--[[ require('user/project') ]]

vim.cmd([[command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor]])
