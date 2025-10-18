#!/bin/bash

set -e

echo "Resetting Neovim state, cache, and plugins..."

# Remove lazy.nvim plugin directory first (more specific)
if [ -d "$HOME/.local/share/nvim/lazy" ]; then
    echo "Removing lazy.nvim plugins..."
    rm -rf "$HOME/.local/share/nvim/lazy"
fi

# Remove other Neovim data (keeping lazy separate for clarity)
if [ -d "$HOME/.local/share/nvim" ]; then
    echo "Removing remaining Neovim data..."
    rm -rf "$HOME/.local/share/nvim"
fi

# Remove Neovim state directory
if [ -d "$HOME/.local/state/nvim" ]; then
    echo "Removing Neovim state directory..."
    rm -rf "$HOME/.local/state/nvim"
fi

# Remove Neovim cache directory
if [ -d "$HOME/.cache/nvim" ]; then
    echo "Removing Neovim cache directory..."
    rm -rf "$HOME/.cache/nvim"
fi

echo "Neovim reset complete!"
echo "Next time you start Neovim, plugins will be reinstalled automatically."