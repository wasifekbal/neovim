# ⚡ Neovim Config

A blazing fast, highly modular, and production-ready Neovim development environment tailored for modern web development, backend architectures, and systems engineering. Optimized for speed, aesthetic transparency, and automated workflows.

![Neovim](https://img.shields.io/badge/NeoVim-0.10+-57A143?style=for-the-badge&logo=neovim&logoColor=white)
![Package Manager](https://img.shields.io/badge/Lazy.nvim-v11-active?style=for-the-badge&color=800080)
![Theme](https://img.shields.io/badge/Catppuccin-Mocha-F5C2E7?style=for-the-badge&logo=cat&logoColor=black)

---

## 🚀 Features

- **Blazing Fast Startup:** Fully async plugin bootstrapping and deferred event loading using `lazy.nvim`.
- **Intelligent IDE Intelligence:** Full LSP integration via `nvim-lspconfig`, managed automatically with `mason.nvim` and `mason-lspconfig`.
- **Advanced Syntax Highlighting:** Context-aware parsing and text-objects utilizing structural `nvim-treesitter` trees.
- **Lightning-Fast Fuzzy Search:** Deep workspace discovery for files, git tracking, strings, and diagnostics via `telescope.nvim`.
- **Rich AI-Assistance:** Integrated code completion powered by `Codeium` for inline code generation.
- **Modern UI Suite:** Clean aesthetic using `catppuccin` (with seamless alpha-transparency support), dynamic breadcrumbs/tabs with `bufferline.nvim`, statusline tracking via `lualine.nvim`, and interactive code actions with `lspsaga.nvim`.
- **Robust Automation:** Global automatic formatting engine via `conform.nvim` alongside structural syntax folding and workspace session persistence.

---

## 📂 Directory Architecture

The configuration follows a clean, modular structure following modern Neovim practices to separate core system options, keybindings, utility helper methods, and third-party plugin specs.

```text
 ~/.config/nvim/
 ├── init.lua                   # Main entrypoint (bootstraps lazy.nvim)
 ├── lazy-lock.json             # Precise tracking hash versions of plugins
 └── lua/
     ├── config/
     │   ├── autocmds.lua       # Event hooks (auto-strip whitespace, text highlight, etc.)
     │   ├── globals.lua        # Global namespace variables
     │   ├── init.lua           # Runs configuration settings
     │   ├── keymaps.lua        # Clean, explicit core keybindings
     │   └── options.lua        # Editor optimizations (scrolloff, clipboard, indents)
     ├── plugins/
     │   ├── nvim-lspconfig/    # Explicit language configurations
     │   ├── alpha.lua          # Visual Dashboard landing page
     │   ├── cmp.lua            # Complete completion framework setup (nvim-cmp)
     │   ├── colorscheme.lua    # Catppuccin configuration with transparency options
     │   ├── gitsigns.lua       # Inline git line tracking and hunks
     │   ├── telescope.lua      # Global picker UI configs
     │   └── whichkey.lua       # Interactive keybinding navigation popup menu
     └── util/
         ├── lsp.lua            # LSP utility hooks (on_attach capabilities)
         └── misc.lua           # Reusable functional helpers

```

---

## 🛠️ Out-of-the-Box LSP Stack

The architecture automatically supports and configures native language servers for multi-paradigm language suites:

* **Frontend ecosystem:** TypeScript/JavaScript (`ts_ls`), Vue (`volar`), HTML/CSS.
* **Systems & Backend:** Go (`gopls`), Python (`pyright`, `ruff`), C/C++ (`clangd`), Java (`jdtls`).
* **Tooling & Environment:** Lua (`lua_ls`), Bash (`bashls`).

---

## ⌨️ Essential Keymaps

Below are some core orchestrations mapped out within the system configuration. *(The spacebar is configured as your active `<leader>` key)*.

### File & Explorer Navigation

| Bind | Action | Context |
| --- | --- | --- |
| `<leader>e` | Toggle File Tree Explorer | `nvim-tree` side panel |
| `<leader>ff` | Search File names across Workspace | `telescope` picker |
| `<leader>fg` | Live Grep string search in code | `telescope` dynamic search |
| `<leader>fb` | List Open Active Buffers | Buffer switcher |

### Code Navigation & LSP Actions

| Bind | Action | Context |
| --- | --- | --- |
| `gd` | Go to Declaration / Definition | Jump to Source code |
| `K` | Display Hover Documentation documentation | Inline signature preview |
| `<leader>ca` | Open Contextual Code Actions | `lspsaga` execution UI |
| `<leader>rn` | Smart Rename variable reference everywhere | Global project refactor |
| `[d` / `]d` | Jump to Previous / Next Diagnostic Error | Inline linter walk |

---

## 📥 Installation & Requirements

### 1. Pre-requisites

Ensure you have the core modern tools available on your path (`Fedora`/`Ubuntu`/`macOS`):

```bash
# Verify minimal version requirements
nvim --version # Must be 0.10.0 or higher

# Necessary external tools for treesitter compilation and telescope searching
gcc --version || clang --version
ripgrep --version
fd --version
fzf --version
yarn --version

```

### 2. Deployment

To install, securely backup your old setup and clone your repository direct to your system's target directory config path:

```bash
# Backup existing files safely if they exist
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak

# Initialize the repository clone
git clone https://github.com/wasifekbal/nvim.git ~/.config/nvim

# Boot the editor up; Lazy.nvim will auto-download and lock your versions
nvim

```

Run `:Lazy sync` or check `:Mason` inside your fresh environment to monitor compilation status and asset downloading logs.

