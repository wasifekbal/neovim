require('user/plugins')
require('user/keymaps')
require('user/colorscheme')
require('user/options')
require('user/cmp')
require('user/lsp')
require('user/telescope')
require('user/treesitter')
require('user/nvimtree')
require('user/autopairs')
require('user/comment')
require('user/bufferline')
require('user/lualine')
require('user/neoformat')
--[[ require('user/coderunner') ]]
require('user/impatient')
require('user/indentline')
require('user/alpha')
--[[ require('user/project') ]]
require('user/gitsigns')
require('user/sessions')
require('user/ts-autotag')
--[[ require('user/colorizer') ]]
--[[ require('user/toggleterm') ]]

vim.cmd([[ source  ~/.config/nvim/ScrollColor.vim ]])
