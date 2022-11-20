local opts = { noremap = true, silent = true }

--[[ local term_opts = { silent = true } ]]

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Misc keybinds
keymap("n", "<F2>", ":set hlsearch!<CR>", opts)
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>q", ":xa<CR>", opts)
keymap("n", "<leader><leader>q", ":qa!<CR>", opts)
keymap("n", "<F3>", ":set spell!<CR>", { silent = true })
keymap("i", "<F3>", "<C-O>:set spell!<CR>", { silent = true })

-- not to store in reg.
keymap("n", "x", '"_x', opts)

-- leader y -> yank in clipboard,
-- else yank in vim reg.
keymap("n", "<leader>y", '"+y', opts)
keymap("v", "<leader>y", '"+y', opts)
keymap("n", "<leader>yy", '"+yy', opts)

-- leader p -> paste from clipboard,
-- else, paste from default vim reg.
keymap("n", "<leader>p", '"+p', opts)
keymap("v", "<leader>p", '"+p', opts)
keymap("n", "<leader>P", '"+P', opts)
keymap("v", "<leader>P", '"+P', opts)

-- Select all
keymap("n", "<leader>s", "gg<S-v>G", opts)

keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Normal --
-- New empty buffer.
keymap("n", "te", ":enew<CR>", opts)
-- Split window
--[[ keymap('n', 'ss', ':split<Return><C-w>w', opts) ]]
--[[ keymap('n', 'sv', ':vsplit<Return><C-w>w', opts) ]]
-- closing buffer.
keymap("n", "<leader>c", ":bd<CR>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
-- keymap("n", "<S-l>", ":bnext<CR>", opts)extend
-- keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
-- keymap("v", "<A-j>", ":m .+1<CR>==", opts)
-- keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- can't remember what it does. but it does something important.
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv=gv", opts)
keymap("x", "K", ":move '<-2<CR>gv=gv", opts)
-- keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
--[[ keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts) ]]
--[[ keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts) ]]
--[[ keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts) ]]
--[[ keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts) ]]

--  Telescope
keymap(
    "n",
    "<leader>ff",
    "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
    --[[ "<cmd>lua require'telescope.builtin'.find_files()<cr>", ]]
    opts
)
keymap("n", "<leader>fg", " <cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
keymap("n", "<leader>fb", " <cmd>lua require('telescope.builtin').buffers()<cr>", opts)
keymap("n", "<leader>fh", " <cmd>lua require('telescope.builtin').help_tags()<cr>", opts)

-- nvim-tree
keymap("n", "<leader>e", "<Cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })

-- bufferline
-- Move to previous/next
keymap("n", "<A-,>", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "<A-.>", ":BufferLineCycleNext<CR>", opts)
-- Re-order to previous/next
keymap("n", "<A-<>", ":BufferLineMovePrev<CR>", opts)
keymap("n", "<A->>", ":BufferLineMoveNext<CR>", opts)
-- pin a tab
--[[ keymap("n", "<A-p>", ":BufferLineTogglePin<CR>", opts) ]]
-- BufferLineGoToBuffer
--[[ keymap("n", "<A-1>", "<Cmd>BufferLineGoToBuffer 1<CR>", opts) ]]
--[[ keymap("n", "<A-2>", "<Cmd>BufferLineGoToBuffer 2<CR>", opts) ]]
--[[ keymap("n", "<A-3>", "<Cmd>BufferLineGoToBuffer 3<CR>", opts) ]]
--[[ keymap("n", "<A-4>", "<Cmd>BufferLineGoToBuffer 4<CR>", opts) ]]
--[[ keymap("n", "<A-5>", "<Cmd>BufferLineGoToBuffer 5<CR>", opts) ]]
--[[ keymap("n", "<A-6>", "<Cmd>BufferLineGoToBuffer 6<CR>", opts) ]]
--[[ keymap("n", "<A-7>", "<Cmd>BufferLineGoToBuffer 7<CR>", opts) ]]
--[[ keymap("n", "<A-8>", "<Cmd>BufferLineGoToBuffer 8<CR>", opts) ]]
--[[ keymap("n", "<A-9>", "<Cmd>BufferLineGoToBuffer 9<CR>", opts) ]]
-- closing buffer
--[[ keymap("n", '<leader>c', ":bd<CR>", opts) ]]

-- neoformat
keymap("n", "<F8>", ":Neoformat<CR>", { noremap = true })
keymap("i", "<F8>", "<C-O>:Neoformat<CR>", { noremap = true })

-- ## code_runner ##
keymap("n", "<C-n>", ":RunCode<CR>", opts)
-- map('n', '<leader>rf', ':RunFile<CR>', opts)
--map('n', '<leader>n', ':RunFile tab<CR>', opts)
-- map('n', '<leader>rp', ':RunProject<CR>', opts)
keymap("n", "<leader>x", ":RunClose<CR>", opts)
-- map('n', '<leader>crf', ':CRFiletype<CR>', opts)
-- map('n', '<leader>crp', ':CRProjects<CR>', opts)

keymap("n", "<leader>bl", ":Gitsigns blame_line<CR>", opts)
keymap("n", "<leader>ph", ":Gitsigns preview_hunk<CR>", opts)
