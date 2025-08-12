# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Architecture Overview

This is a modern Neovim configuration using Neovim's native package manager (`vim.pack.add`) instead of lazy.nvim. The configuration follows a clean, modular structure:

- **Entry point**: `init.lua` loads core configuration modules from `lua/config/`
- **Plugin installation**: `plugin/install.lua` declares all plugins with `vim.pack.add`
- **Plugin configurations**: `after/plugin/` directory contains plugin-specific configurations
- **LSP & tooling**: `plugin/mason.lua` handles LSP servers, formatting, and Mason setup
- **Core configuration**: `lua/config/` contains options, keymaps, autocmds, and LSP setup
- **Deprecated**: `lua/plugins/` directory contains old lazy.nvim specs (not in use)

## Plugin Management System

- Uses Neovim's native package manager (`vim.pack.add`)
- **Installation**: `plugin/install.lua` declares all plugins in organized groups
- **Configuration**: `after/plugin/` contains individual plugin configurations
- **LSP Management**: Mason automatically installs and manages language servers
- Plugins are loaded automatically by Neovim's built-in plugin system
- No external plugin manager dependencies

## Key Components

### Completion System
- **blink.cmp**: Primary completion engine with LSP, buffer, path, snippets, NPM, and emoji support
- **mini.snippets**: Snippet engine integrated with blink.cmp
- **LuaSnip**: Additional snippet support with friendly-snippets

### LSP Configuration
- Native Neovim LSP with nvim-lspconfig and Mason integration
- **Active language servers**: `lua_ls`, `ts_ls`, `vue_ls`, `tailwindcss`, `html`, `cssls`, `jsonls`, `yamlls`
- **Vue.js support**: Advanced Vue LSP setup with TypeScript integration
- **Auto-formatting**: conform.nvim with biome, prettier, stylua, black, isort
- **Format on save**: enabled with 500ms timeout and LSP fallback
- **Mason auto-install**: automatically ensures required servers are installed

### File Management
- **oil.nvim**: File explorer with floating window (`-` key) and LSP diagnostics
- **telescope.nvim**: File picker and fuzzy finder (still available alongside snacks)

### UI Enhancements
- **kanagawa**: Colorscheme with transparent background and dragon theme
- **mini.nvim suite**: Multiple modules (pairs, comment, surround, AI text objects)
- **hlchunk.nvim**: Indentation guides and chunk highlighting
- **trouble.nvim**: Diagnostics and quickfix list
- **which-key.nvim**: Key binding popup and documentation

### Notifications & UI Libraries
- **nvim-notify**: Modern notification system (set as default vim.notify)
- **nui.nvim**: UI component library
- **plenary.nvim**: Lua utility functions for other plugins

### Database Tools
- **vim-dadbod**: Database interface
- **vim-dadbod-ui**: Database UI with tree view
- **vim-dadbod-completion**: SQL completion integration

### Treesitter
- Core treesitter with auto-install for common languages
- Context display with treesitter-context
- Auto-tag completion for HTML/JSX with nvim-ts-autotag
- Auto-updates parsers on plugin updates

### TypeScript & Vue.js Support
- **TypeScript tooling**: ts-error-translator.nvim for readable error messages
- **TypeScript compiler**: tsc.nvim for type checking integration
- **Vue.js LSP**: Advanced Vue language server with TypeScript plugin integration
- **Vue-TypeScript bridge**: Custom request forwarding between vue_ls and ts_ls
- **Inlay hints**: Enabled for TypeScript/JavaScript with comprehensive type information

### Markdown & Documentation
- **Obsidian integration**: obsidian.nvim for note-taking workflows
- **Render markdown**: render-markdown.nvim for enhanced markdown display

## Development Commands

### Plugin Management
- Check plugin status: `:PackStatus` (native Neovim command)
- Update plugins: `:PackUpdate` (custom command for all packages)
- Clean plugins: `:PackClean` (native Neovim command)

### LSP & Mason Commands
- LSP info: `:LspInfo`
- LSP restart: `:LspRestart`
- Mason UI: `:Mason` (install/manage language servers)
- Mason install: `:MasonInstall <server_name>`
- Manual format: `<leader>f` (uses conform.nvim, automatic on save)

### TypeScript Commands
- TypeScript check: `:TSC` (via tsc.nvim)
- Error translation: Automatic via ts-error-translator

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

### Telescope
- Find files: `<leader>ff`
- Live grep: `<leader>fg`
- Buffers: `<leader>fb`
- Help tags: `<leader>fh`
- Man pages: `<leader>fm`
- Colorschemes: `<leader>fc`
- LSP symbols: `<leader>ft`

### LSP Navigation
- Go to definition: `gd`
- Go to declaration: `gD`
- Show references: `gr`
- Go to implementation: `gi`
- Show hover info: `K`
- Signature help: `<C-k>`
- Rename symbol: `<leader>rn`
- Code actions: `<leader>ca`
- Format code: `<leader>f`

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
├── init.lua                    # Entry point, loads config modules
├── plugin/                     # Plugin installation and core setup
│   ├── install.lua            # Plugin declarations with vim.pack.add
│   ├── mason.lua              # LSP servers, formatting, Mason setup
│   └── update_autocommand.lua # PackUpdate command implementation
├── after/plugin/               # Plugin configurations (loaded after plugins)
│   ├── cmp.lua                # Blink completion setup
│   ├── db.lua                 # Database tools (dadbod)
│   ├── markdown.lua           # Markdown and Obsidian setup
│   ├── oil.lua                # File explorer configuration
│   ├── telescope.lua          # Telescope picker setup
│   ├── treesitter.lua         # Syntax highlighting setup
│   ├── ui.lua                 # UI plugins (kanagawa, hlchunk, which-key)
│   └── which-key.lua          # Key binding documentation
├── after/ftplugin/            # Filetype-specific configurations
├── lua/config/                # Core Neovim configuration
│   ├── options.lua            # Neovim options
│   ├── keymaps.lua            # Global key mappings
│   ├── autocmd.lua            # Auto commands
│   └── lsp.lua                # LSP-specific settings
└── scripts/
    └── reset-nvim.sh          # Reset script for clean reinstall
```

## Configuration Patterns

### Adding New Plugins
1. Add plugin declaration to `plugin/install.lua` using `vim.pack.add { { src = 'github-url' } }`
2. Create configuration file in `after/plugin/` directory for plugin setup
3. Plugin will be automatically loaded on next Neovim start
4. For LSP servers, add to Mason's `ensure_installed` list in `plugin/mason.lua`

### Language Server Setup
- Add server to Mason's `ensure_installed` list in `plugin/mason.lua`
- Configure server using `vim.lsp.config('server_name', config)` in `plugin/mason.lua`
- Enable server with `vim.lsp.enable` in same file
- Add formatters to conform.nvim configuration in `plugin/mason.lua`

## Notes
- Modern Neovim configuration using native package management (requires Neovim 0.11+)
- Running on Neovim 0.12 nightly with latest native package management features
- No lazy loading - all plugins load at startup for simplicity
- Transparent background enabled for terminal integration
- Auto-formatting on save with fallback to LSP formatting
- Mason handles automatic LSP server installation and management
- When using vim.pack.add() always use the full src url
- Vue.js development fully supported with TypeScript integration
- Extensions may require build tools (base-devel, cmake) on Arch Linux

## Recent Changes (Latest Commits)
- **f0a41fd**: Vue LSP integration working with TypeScript support
- **5bb47f3**: Merged UI and init plugin files; updated blink completion
- **1142c0b**: Configuration reorganization and fixes
- **e1d9d9a**: Major architectural updates to plugin structure
- **4342343**: Replaced telescope with snacks.nvim and added which-key