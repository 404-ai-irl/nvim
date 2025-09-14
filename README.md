# Tbone's Neovim Configuration

A modern Neovim setup using native package management with integrated automatic build system.

> [!IMPORTANT] Requires Neovim version 0.12+
> Uses `vim.pack.add` with automated build management via PackChanged autocmds.

## Features

### 🚀 Native Package Management
- Built on Neovim's native `vim.pack.add` system
- **Automatic build system** - plugins with build steps compile automatically on install/update
- Zero external plugin manager dependencies
- PackChanged autocmds trigger builds seamlessly

### 🔧 Integrated Build Automation
- **Smart build registry** - stores build commands per plugin
- **Auto-building** - builds trigger automatically when plugins are installed/updated
- **Manual builds** - `:Build <plugin>` command with interactive prompts
- **Build validation** - checks for required build tools and plugin directories

### ⚡ Core Functionality
- LSP with Mason auto-install and management
- Blink.cmp completion with multiple sources (including AI assistance)
- Oil.nvim for directory editing
- Telescope for fuzzy finding with native FZF integration
- Obsidian integration for note-taking
- Database tools (vim-dadbod) with completion
- Auto-formatting on save (conform)
- Treesitter with advanced text objects

## Requirements

- **Neovim 0.12+** (for native vim.pack support)
- **Git** (for plugin installation)
- **Node.js** (for LSP servers)
- **Build tools** (automatically checked per plugin):
  - `make` (for telescope-fzf-native, LuaSnip)
  - `cargo` (for blink.cmp, blink.nvim)
  - `cmake` (for some LSP servers)

## Installation

**⚠️ Backup your existing config first:**
```bash
mv ~/.config/nvim ~/.config/nvim.backup
```

**Clone and start:**
```bash
git clone <this-repo> ~/.config/nvim
nvim  # Plugins install and build automatically
```

**First launch:**
- Plugins install automatically via `vim.pack.add`
- Build steps trigger automatically for plugins that need them
- LSP servers install via Mason on first use

## Architecture

### Plugin Management with Build Integration

```lua
Add {
  -- Simple plugin (no build needed)
  { src = 'neovim/nvim-lspconfig' },

  -- Plugin with automatic build
  { src = 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

  -- Rust plugin with cargo build
  { src = 'Saghen/blink.cmp', build = 'cargo build --release' },
}
```

### Automatic Build Process
1. **Plugin Installation** - `vim.pack.add` installs plugin
2. **PackChanged Event** - Autocmd detects install/update
3. **Build Trigger** - Automatically runs registered build command
4. **Validation** - Checks build success and reports status

### Manual Build Commands

```vim
" Build plugin with registered command
:Build telescope-fzf-native.nvim

" Build plugin with custom command
:Build my-plugin make clean && make install

" Build with interactive prompt (if no registered command)
:Build some-plugin
" Prompts: Build command for some-plugin: [make]
```

## Plugin Categories

### Core Development
- **LSP**: nvim-lspconfig + Mason (auto-install)
- **Completion**: blink.cmp with multi-source support
- **Formatting**: conform.nvim with auto-save
- **Linting**: nvim-lint with real-time feedback

### Navigation & UI
- **File Management**: oil.nvim (directory editor)
- **Fuzzy Finding**: telescope.nvim + fzf-native (auto-built)
- **Syntax**: treesitter with text objects
- **Theme**: kanagawa colorscheme

### Productivity
- **Note-taking**: obsidian.nvim integration
- **Database**: vim-dadbod suite with completion
- **Terminal**: integrated terminal support
- **Git**: Native git integration

## Build System Details

### Registry System
```lua
-- Plugins register build commands automatically
local build_registry = {
  ["telescope-fzf-native.nvim"] = "make",
  ["blink.cmp"] = "cargo build --release",
  ["LuaSnip"] = "make install_jsregexp"
}
```

### Build Validation
- ✅ **Plugin directory exists** - Validates plugin is properly installed
- ✅ **Build command available** - Checks if required build tools are installed
- ✅ **Build success** - Reports build status with detailed error messages
- ✅ **Automatic retry** - Builds trigger again on plugin updates

### Troubleshooting Builds

**Build failed?**
```vim
:Build plugin-name make clean && make  " Force rebuild with clean
:Build LuaSnip make install_jsregexp    " Fix LuaSnip jsregexp library
```

**Missing build tools?**
```bash
# Arch Linux
sudo pacman -S base-devel cmake cargo

# Ubuntu/Debian
sudo apt install build-essential cmake cargo

# macOS
xcode-select --install
brew install rust
```

**Common Build Issues:**
- **LuaSnip jsregexp warning**: Use `:Build LuaSnip` to install jsregexp library
- **Rust/Cargo missing**: Install Rust toolchain for blink.cmp compilation
- **Make not found**: Install build-essential or base-devel package

**Check plugin status:**
```vim
:lua print(vim.inspect(build_registry))  " View registered build commands
:lua print(vim.inspect(vim.fn.stdpath('data') .. '/site/pack/core/opt/'))
```

## Reset Script

If things break (they might):
```bash
./scripts/reset-nvim.sh  # Nuclear option - removes all cache/state
```

## Advanced Usage

### Custom Build Commands
Add plugins with custom build steps:
```lua
Add {
  { src = 'user/custom-plugin', build = 'npm install && npm run build' }
}
```

### Build Monitoring
Watch build progress in real-time via notifications, or check build registry:
```lua
:lua print(vim.inspect(build_registry))
```

---

**Built with ❤️ using Neovim's native capabilities + smart automation**