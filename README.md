# Neovim Configuration

A modern Neovim setup using native package management instead of external plugin managers.

## Features

- Native Neovim package manager (`vim.pack.add`)
- LSP with Mason auto-install and management
- Blink.cmp completion with multiple sources
- Oil.nvim for directory editing
- Telescope for fuzzy finding
- Vue.js + TypeScript support
- Database tools (vim-dadbod)
- Obsidian integration
- Auto-formatting on save

## Installation

**⚠️ Backup your existing config first:**
```bash
mv ~/.config/nvim ~/.config/nvim.backup
```

Then clone and start:
```bash
git clone <this-repo> ~/.config/nvim
nvim  # Plugins install automatically
```

## Key Commands

### Plugin Management
- `:PackStatus` - Check plugin status
- `:PackUpdate` - Update all plugins  
- `:PackClean` - Remove unused plugins

### LSP & Development
- `:Mason` - Manage language servers
- `:LspInfo` - View active LSP servers
- `:LspRestart` - Restart LSP servers
- `:TSC` - TypeScript type checking

### File Navigation
- `-` - Open oil.nvim file explorer
- `<leader>ff` - Find files (Telescope)
- `<leader>fg` - Live grep search
- `<leader>fb` - Browse buffers

### Database
- `<leader>du` - Toggle database UI
- `<leader>df` - Find database buffers

## Reset Script

If things break (they might):
```bash
./scripts/reset-nvim.sh  # Nuclear option - removes all cache/state
```

## Requirements

- Neovim 0.11+ (uses native package management)
- Git (for plugin installation)
- Node.js (for LSP servers)
- Build tools for some plugins (cmake, base-devel on Arch)