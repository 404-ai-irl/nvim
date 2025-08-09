#!/bin/bash

set -e

echo "Resetting Neovim state, cache, and plugins..."

# Remove Neovim data directory (state, shada, etc.)
if [ -d "$HOME/.local/share/nvim" ]; then
    echo "Removing Neovim data directory..."
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

# Remove lazy.nvim plugin directory
if [ -d "$HOME/.local/share/nvim/lazy" ]; then
    echo "Removing lazy.nvim plugins..."
    rm -rf "$HOME/.local/share/nvim/lazy"
fi

echo "Neovim reset complete!"
echo "Next time you start Neovim, plugins will be reinstalled automatically."