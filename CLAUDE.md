# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Architecture Overview

This is a sophisticated Neovim configuration built on **native package management** (`vim.pack.add`) with a custom automated build system. It eschews external plugin managers in favor of Neovim 0.12+'s built-in capabilities.

### Core Innovation: Automated Build System

The configuration features a unique build automation system that wraps `vim.pack.add`:

```lua
-- Custom Add function with build integration
Add {
  { src = 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  { src = 'Saghen/blink.cmp', build = 'cargo build --release' }
}
```

**Key Components:**
- **Build Registry**: Stores build commands per plugin in `build_registry` table
- **PackChanged Autocmd**: Automatically triggers builds on plugin install/update
- **BuildPlugin()**: Global function for manual and automatic builds
- **Validation**: Checks plugin directories and build tool availability

## Configuration Structure

```
init.lua                    # Entry point + Add function + plugin definitions
lua/404-ai-irl/            # Core configuration module (options, keymaps, LSP, autocmds)
after/plugin/             # Post-load plugin configs (mason, blink, telescope, obsidian, etc)
```

**Loading Pattern:**
- `init.lua` loads plugins via custom `Add()` function with build automation
- `lua/404-ai-irl/init.lua` requires core modules (options, keymaps, LSP, autocmds)
- `after/plugin/` configs run after all plugins loaded (mason, blink, telescope, etc)
- **PackChanged** autocmds automatically trigger builds when plugins install/update

## Essential Commands

### Build System
```vim
:Build <plugin-name>                    # Use registered build command
:Build <plugin-name> <custom-command>   # Use provided build command
:Build <plugin-name>                    # Interactive prompt if no registered command
```

### Development
```bash
./reset.sh                             # Nuclear reset - clears all Neovim state/cache
```

```vim
:Mason                                 # LSP server management
:lua print(vim.inspect(build_registry)) # View registered build commands
```

### Navigation (Leader-based)
```vim
<leader><space>    # Quick file find (Telescope)
<leader>/          # Live grep
<leader>ff         # Find files
<leader>ll         # LSP diagnostics to loclist
<leader>la         # LSP code actions
```

## Key Architectural Patterns

### 1. Two-Tier Plugin Configuration
- **`plugin/`**: Core functionality that must load early (Mason, Blink completion, Treesitter)
- **`after/plugin/`**: UI and features that depend on core plugins (Telescope, themes, keybinds)

### 2. Which-Key Organization
Keybindings use which-key.nvim with descriptive groups:
- `<leader>f*` - File operations
- `<leader>g*` - Git operations
- `<leader>s*` - Search operations
- `<leader>l*` - LSP/diagnostics
- `<leader>t*` - Toggles
- `<leader>a*` - AI tools

### 3. Auto-Installation Ecosystem
- **Plugins**: Install and build automatically via `vim.pack.add` + build system
- **LSP Servers**: Auto-install via Mason on first language file open
- **Dependencies**: Build tools validated and reported if missing

## Plugin Categories

**Core Development Stack (37 total plugins):**
- **LSP**: nvim-lspconfig + mason.nvim (auto-install servers)
- **Completion**: blink.cmp (Rust-based, multi-source)
- **Syntax**: treesitter with text objects and context
- **Tools**: conform (format), nvim-lint, telescope (fzf-native)
- **AI**: claudecode.nvim integration

**Productivity Suite:**
- **Files**: oil.nvim (directory editing), telescope (fuzzy finding)
- **Notes**: obsidian.nvim with render-markdown.nvim
- **Database**: vim-dadbod suite with blink completion
- **UI**: kanagawa theme, bufferline, snacks.nvim, which-key

## Build System Details

### Automatic Process
1. `Add()` function stores build commands in registry
2. `vim.pack.add()` installs plugin
3. `PackChanged` autocmd detects install/update
4. `BuildPlugin()` executes with validation
5. Status notifications show success/failure

### Manual Building
The `:Build` command supports three modes:
- **Registered**: Uses stored build command from registry
- **Custom**: Accepts build command as arguments
- **Interactive**: Prompts user if no registered command

### Build Validation
- Checks plugin directory exists in `/site/pack/core/opt/`
- Validates build command executable is available
- Reports detailed error messages for failures
- Supports complex build commands with `&&` chains

## Development Workflow

1. **Initial Setup**: Clone repo, launch Neovim - plugins auto-install and build
2. **LSP Integration**: Language servers install automatically on first file of type
3. **Code Navigation**: Use Telescope for files/symbols, oil.nvim for directories
4. **Completion**: blink.cmp provides multi-source completion (LSP, snippets, AI)
5. **Maintenance**: Use `:Build` for rebuilds, `./reset.sh` for complete cleanup

## Common Issues & Troubleshooting

### Build System Issues
- **LuaSnip jsregexp warning**: Run `:Build LuaSnip` to install jsregexp library
- **Build failures**: Check if build tools (make, cargo, cmake) are installed
- **Plugin not building**: Verify plugin directory exists and build command is correct
- **API errors**: Ensure using `vim.deepcopy()` not `vim.tbl_deep_copy()`

### Configuration Loading Issues
- **Plugin not found**: Ensure plugins in `after/plugin/` not `plugin/` directory
- **Duplicate setup**: Check for duplicate configurations across files
- **Loading order**: Core configs in `lua/404-ai-irl/`, plugin configs in `after/plugin/`

### Build Commands Reference
```vim
:Build LuaSnip                    " Use registered: make install_jsregexp
:Build blink.cmp                  " Use registered: cargo build --release
:Build telescope-fzf-native.nvim  " Use registered: make
:Build plugin-name custom-command " Use custom build command
```

## Important Files to Understand

- `init.lua` - Custom `Add()` function and build automation system
- `lua/404-ai-irl/lsp.lua` - LSP configuration and linting setup
- `after/plugin/blink.lua` - Primary completion engine configuration (116 lines)
- `after/plugin/mason.lua` - LSP server management and auto-installation
- `after/plugin/telescope.lua` - Fuzzy finder with extensive customization (212 lines)
- `after/plugin/wk.lua` - Which-key keybind organization (154 lines)
- `after/plugin/obsidian.lua` - Note-taking integration (200+ lines)

This configuration represents a modern, self-contained Neovim setup that prioritizes automation, native capabilities, and developer experience without external plugin manager dependencies.