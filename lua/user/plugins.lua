local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer, close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

-- Install your plugins here
return packer.startup(function(use)
    use("wbthomason/packer.nvim") -- Have packer manage itself
    use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
    use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
    use("windwp/nvim-autopairs") -- autopairs for neovim written by lua
    use("windwp/nvim-ts-autotag") -- Use treesitter to auto close and auto rename html tag
    --
    -- Colorschemes
    use("sainnhe/everforest")
    use("ellisonleao/gruvbox.nvim")
    use("catppuccin/nvim")

    -- lsp
    use({
        "williamboman/mason.nvim", -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
        "williamboman/mason-lspconfig.nvim", -- Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim.
        "neovim/nvim-lspconfig", -- helps in lsp configuration.
    })
    use("jose-elias-alvarez/null-ls.nvim")

    -- cmp
    use("hrsh7th/nvim-cmp") -- A completion plugin for neovim coded in Lua.
    use("hrsh7th/cmp-buffer") -- nvim-cmp source for buffer words
    use("hrsh7th/cmp-path") -- nvim-cmp source for path
    use("hrsh7th/cmp-cmdline") -- nvim-cmp source for vim's cmdline
    use("hrsh7th/cmp-nvim-lua") -- nvim-cmp source for nvim lua
    use("hrsh7th/cmp-nvim-lsp") -- nvim-cmp source for neovim builtin LSP client

    -- snippets.
    use("L3MON4D3/LuaSnip") -- Snippet Engine for Neovim written in Lua.
    use("saadparwaiz1/cmp_luasnip") -- luasnip completion source for nvim-cmp
    use("rafamadriz/friendly-snippets") -- Set of preconfigured snippets for different languages.
    use({ -- Extension for React/Javascript snippets with search supporting ES7+ and babel features
        "dsznajder/vscode-es7-javascript-react-snippets",
        run = "yarn install --frozen-lockfile && yarn compile",
    })

    -- telescope
    use("nvim-telescope/telescope.nvim") -- highly extendable fuzzy finder over lists.
    use("nvim-telescope/telescope-media-files.nvim") -- Telescope extension to preview media files using Ueberzug.

    -- treesitter
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) -- highly efficient syntax highlighter.
    use("p00f/nvim-ts-rainbow") -- Rainbow parentheses for neovim using tree-sitter.

    -- nvim-tree
    use({
        "kyazdani42/nvim-tree.lua", -- A file explorer tree for neovim written in lua
        requires = {
            "kyazdani42/nvim-web-devicons", -- optional, for file icons
        },
    })

    -- comments
    use("numToStr/Comment.nvim") -- Smart and powerful comment plugin for neovim. Supports treesitter
    use("JoosepAlviste/nvim-ts-context-commentstring") -- Neovim treesitter plugin for setting the commentstring based on the cursor location in a file.

    -- bufferline
    use({ "akinsho/bufferline.nvim", tag = "v2.*" }) -- A snazzy bufferline for Neovim

    -- lualine
    use("nvim-lualine/lualine.nvim") -- A blazing fast and easy to configure neovim statusline plugin written in pure lua.

    -- code formatter
    use("mhartington/formatter.nvim") -- a kickass code formatter.

    -- code-runner
    use("CRAG666/code_runner.nvim") -- Code runner

    -- impatient (speed loading lua modules)
    use("lewis6991/impatient.nvim")

    -- indent-blankline
    use("lukas-reineke/indent-blankline.nvim") -- Indent guides for Neovim

    -- Alpha dashboard
    use("goolord/alpha-nvim") -- a lua powered greeter like vim-startify / dashboard-nvim

    -- projects manage
    --[[ use("ahmedkhalf/project.nvim") -- The superior project management solution for neovim. ]]

    -- gitsigns
    use("lewis6991/gitsigns.nvim") -- Git integration for buffers

    use("Shatur/neovim-session-manager") -- A simple wrapper around :mksession. for management of sessions.

    --[[ use({ "akinsho/toggleterm.nvim", tag = "v2.*" }) -- A neovim lua plugin to help easily manage multiple terminal windows ]]

    use("ThePrimeagen/vim-be-good") -- vim-be-good is a nvim plugin designed to make you better at Vim Movements.

    --[[ color highlighter for Neovim ]]
    use("norcalli/nvim-colorizer.lua") -- The fastest Neovim colorizer.

    use({ "iamcco/markdown-preview.nvim", run = "cd app && yarn install" })

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
