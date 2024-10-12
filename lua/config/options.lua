-- :help options

local options = {
    tabstop = 4, -- insert 4 spaces for a tab
    softtabstop = 4,
    shiftwidth = 4, -- the number of spaces inserted for each indentation
    expandtab = true, -- convert tabs to spaces
    smartcase = true, -- smart case
    wrap = false, -- display lines as one long line
    ignorecase = true, -- ignore case in search patterns
    smartindent = true, -- make indenting smarter again
    relativenumber = true, -- set relative numbered lines
    number = true, -- set numbered lines
    numberwidth = 2, -- set number column width to 2 {default 4}
    -- colorcolumn = '100',
    termguicolors = true, -- set term gui colors (most terminals support this)
    signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
    showcmd = true,
    cmdheight = 1, -- more space in the neovim command line for displaying messages
    scrolloff = 8, -- is one of my fav
    sidescrolloff = 8,
    completeopt = { "menuone", "noselect", "noinsert" }, -- mostly just for cmp
    swapfile = false, -- creates a swapfile
    backup = false, -- creates a backup file
    writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    undofile = true, -- enable persistent undo
    --[[ undodir = vim.fn.expand("~/.vim/undotree"), ]]
    undodir = vim.fn.expand("~/.local/share/nvim/undotree"),
    splitbelow = true, -- force all horizontal splits to go below current window
    splitright = true, -- force all vertical splits to go to the right of current window
    mouse = "a", -- allow the mouse to be used in neovim
    clipboard = "unnamedplus", -- allows neovim to access the system clipboard
    guicursor = "", -- block size cursor, even in insert mode.
    fileencoding = "utf-8", -- the encoding written to a file
    background = "dark",
    cursorline = false, -- highlight the current line
    autoindent = true,

    pumblend = 5,
    winblend = 5,
    wildoptions = "pum",
    inccommand = "split",
    shell = "bash",
    foldmethod = "indent",
    conceallevel = 0, -- so that `` is visible in markdown files
    hlsearch = false, -- highlight all matches on previous search pattern
    pumheight = 10, -- pop up menu height
    showmode = false, -- we don't need to see things like -- INSERT -- anymore
    showtabline = 2, -- always show tabs
    timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
    updatetime = 50, -- faster completion (4000ms default)
    guifont = "FiraCode Nerd Font:h17", -- the font used in graphical neovim applications
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.opt.shortmess:append("c")
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.cmd([[filetype plugin indent on]])
--
-- Add custom filetype detection for *.ssh.config files
vim.cmd([[autocmd BufNewFile,BufRead *.ssh.conf setfiletype sshconfig]])

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
-- vim.api.nvim_create_autocmd("InsertLeave", {
--     pattern = "*",
--     command = "set nopaste",
-- })

-- Add asterisks in block comments
-- vim.opt.formatoptions:append({ "r" })

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set nofoldenable]])
vim.cmd([[set foldlevel=99]])
-- vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work

-- override the color of line number.
-- vim.cmd([[highlight LineNr guifg=#e0a0a0]])

