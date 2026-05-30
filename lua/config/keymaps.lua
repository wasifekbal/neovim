local opts = { noremap = true, silent = true }

--[[ local term_opts = { silent = true } ]]

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)

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
keymap("n", "<leader><leader>w", ":w!<CR>", opts)
keymap("n", "<leader>q", ":xa<CR>", opts)
keymap("n", "<leader><leader>q", ":qa!<CR>", opts)
keymap("n", "<F3>", ":set spell!<CR>", { silent = true })
keymap("i", "<F3>", "<C-O>:set spell!<CR>", { silent = true })

keymap("n", "<F4>", ":set wrap!<CR>", { silent = true })
keymap("i", "<F4>", "<C-O>:set wrap!<CR>", { silent = true })

-- Vertically center next search.
keymap("n", "n", "nzz", { silent = true })
keymap("n", "N", "Nzz", { silent = true })

-- not to store in reg.
keymap("n", "x", '"_x', opts)

-- Select all
keymap("n", "<leader>a", "gg<S-v>G", opts)

keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Normal --
-- New empty buffer.
keymap("n", "te", ":enew<CR>", opts)

-- Split window
keymap("n", "ss", ":split<Return><C-w>w", opts) -- Split Horizontally
keymap("n", "sv", ":vsplit<Return><C-w>w", opts) -- Split Vertically
keymap("n", "<leader>z", ":MaximizerToggle<CR>", opts) -- Toggle Minimize

-- closing buffer.
keymap("n", "<leader>c", ":bd<CR>", opts)
keymap("n", "<leader><leader>c", ":bd!<CR>", opts)

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

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("v", "H", "<gv", opts)
keymap("v", "L", ">gv", opts)

-- can't remember what it does. but it does something important.
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv=gv", opts)
keymap("x", "K", ":move '<-2<CR>gv=gv", opts)

-- nvim-tree
keymap("n", "<leader>e", "<Cmd>NvimTreeToggle<CR>", opts)
keymap("n", "<leader>lf", "<cmd>NvimTreeFindFile<CR>", opts)

-- bufferline
-- Move to previous/next
keymap("n", "<A-,>", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "<A-.>", ":BufferLineCycleNext<CR>", opts)
-- Re-order to previous/next
keymap("n", "<A-<>", ":BufferLineMovePrev<CR>", opts)
keymap("n", "<A->>", ":BufferLineMoveNext<CR>", opts)

-- formatter
vim.keymap.set({ "n", "v", "i" }, "<F8>", function()
    require("conform").format({
        async = true,
        lsp_fallback = true,
    })
end, { desc = "Format file or range" })

-- gitsigns
keymap("n", "<leader>bl", ":Gitsigns blame_line<CR>", opts)
keymap("n", "<leader>ph", ":Gitsigns preview_hunk<CR>", opts)
keymap("n", "<leader>dt", ":Gitsigns diffthis<CR>", opts)
keymap("n", "<leader>[h", ":Gitsigns prev_hunk<CR>", opts)
keymap("n", "<leader>]h", ":Gitsigns next_hunk<CR>", opts)
