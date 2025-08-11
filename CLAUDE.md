# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Architecture Overview

This is a modern Neovim configuration using Neovim's native package manager (`vim.pack.add`) instead of lazy.nvim. The configuration follows a clean, modular structure:

- **Entry point**: `init.lua` loads core configuration modules from `lua/config/`
- **Plugin configurations**: `/plugin` directory contains all active plugin setups with `vim.pack.add`
- **Core configuration**: `lua/config/` contains options, keymaps, autocmds, and LSP setup
- **Deprecated**: `lua/plugins/` directory contains old lazy.nvim specs (not in use)

## Plugin Management System

- Uses Neovim's native package manager (`vim.pack.add`)
- Each plugin configuration file in `/plugin` handles both installation and setup
- Plugins are loaded automatically by Neovim's built-in plugin system
- No external plugin manager dependencies

## Key Components

### Completion System
- **blink.cmp**: Primary completion engine with LSP, buffer, path, snippets, NPM, and emoji support
- **mini.snippets**: Snippet engine integrated with blink.cmp
- **LuaSnip**: Additional snippet support with friendly-snippets

### LSP Configuration
- Native Neovim LSP with nvim-lspconfig
- Active language servers: `lua_ls`, `ts_ls`
- Auto-formatting with conform.nvim (stylua, rustfmt, biome/prettier)
- Format on save enabled with 500ms timeout

### File Management
- **oil.nvim**: File explorer with floating window (`-` key)
- **snacks.nvim**: Modern picker/fuzzy finder replacing telescope

### UI Enhancements
- **kanagawa**: Colorscheme with transparent background and dragon theme
- **mini.nvim suite**: Multiple modules (pairs, comment, surround, AI text objects)
- **hlchunk.nvim**: Indentation guides and chunk highlighting
- **trouble.nvim**: Diagnostics and quickfix list
- **which-key.nvim**: Key binding popup and documentation

### Notifications
- **noice.nvim**: Enhanced UI for messages, cmdline, and popupmenu
- **nvim-notify**: Modern notification system
- **nui.nvim**: UI component library for noice

### Database Tools
- **vim-dadbod**: Database interface
- **vim-dadbod-ui**: Database UI with tree view
- **vim-dadbod-completion**: SQL completion integration

### Treesitter
- Core treesitter with auto-install for common languages
- Context display with treesitter-context
- Auto-tag completion for HTML/JSX with nvim-ts-autotag
- Auto-updates parsers on plugin updates

## Development Commands

### Plugin Management
- Check plugin status: `:PackStatus` (native Neovim command)
- Update plugins: `:PackUpdate` (custom command for all packages)
- Clean plugins: `:PackClean` (native Neovim command)

### LSP Commands
- LSP info: `:LspInfo`
- LSP restart: `:LspRestart`
- Manual format: Uses conform.nvim (automatic on save)

### Treesitter Commands
- Update parsers: `:TSUpdate`
- Install parsers: `:TSInstall <language>`

### Configuration Reset
- Complete reset: `./scripts/reset-nvim.sh` (removes all cache, state, and plugins)

## Key Mappings

### Core Navigation
- Leader key: `<space>`
- File explorer: `-` (oil.nvim floating window)
- Tree view: `<leader>e` (blink tree)
- Escape insert mode: `jj` or `jk`

### Picker (Snacks)
- Find files: `<leader>ff`
- Live grep: `<leader>fg`
- Buffers: `<leader>fb`
- Help tags: `<leader>fh`
- Man pages: `<leader>fm`
- Colorschemes: `<leader>fc`
- LSP symbols: `<leader>ft`

### Database
- Toggle DBUI: `<leader>du`
- Find DB buffer: `<leader>df`
- Rename DB buffer: `<leader>dr`
- Last query info: `<leader>dq`

### Utility
- Toggle comma at EOL: `,`
- Toggle semicolon at EOL: `<C-;>`
- Buffer delete: `<leader>bx`
- Window navigation: `<C-hjkl>`

## File Structure

```
├── init.lua                 # Entry point, loads config modules
├── plugin/                  # Active plugin configurations (vim.pack.add)
│   ├── 00_blink.lua        # Completion system (loads first)
│   ├── lsp.lua             # LSP and formatting setup
│   ├── snacks.lua          # Modern picker/fuzzy finder
│   ├── ui.lua              # UI plugins (kanagawa, trouble, hlchunk)
│   ├── notifications.lua   # Notification system (noice, nvim-notify)
│   ├── mini.lua            # Mini.nvim suite
│   ├── treesitter.lua      # Syntax highlighting
│   ├── oil.lua             # File explorer
│   ├── which-key.lua       # Key binding documentation
│   ├── db.lua              # Database tools (dadbod)
│   ├── schemastore.lua     # JSON schema support
│   └── pack-update.lua     # Package update command
├── lua/config/             # Core configuration
│   ├── options.lua         # Neovim options
│   ├── keymaps.lua         # Global key mappings
│   ├── autocmd.lua         # Auto commands
│   └── lsp.lua             # LSP-specific settings
└── scripts/
    └── reset-nvim.sh       # Reset script for clean reinstall
```

## Configuration Patterns

### Adding New Plugins
1. Create new file in `/plugin` directory
2. Use `vim.pack.add { { src = 'github-url' } }` to declare plugin
3. Add plugin setup/configuration in same file
4. Plugin will be automatically loaded on next Neovim start

### Language Server Setup
- Add server configuration in `/plugin/lsp.lua`
- Use `vim.lsp.config('server_name', config)` and `vim.lsp.enable`
- Conform.nvim formatters configured in same file

## Notes
- Modern Neovim configuration using native package management (requires Neovim 0.11+)
- No lazy loading - all plugins load at startup for simplicity
- Transparent background enabled for terminal integration
- Auto-formatting on save with fallback to LSP formatting
- Remember that im using nvim 0.12 nightly
- When using vim.pack.add() always use the full src url
- For telescope-fzf-native.nvim, use cmake build command to compile native library
- Extensions like fzf-native may require build tools (base-devel, cmake) on Arch Linux