local add = vim.pack.add

--- Package Dependencies
add {
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/MunifTanjim/nui.nvim' },
  { src = 'https://github.com/rcarriga/nvim-notify' },
}

--- Set notify-nvim as default notification system
vim.notify = require 'notify'

--- Treesitter
add {
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'master' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter-context' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects' },
  { src = 'https://github.com/windwp/nvim-ts-autotag' },
}

--- UI
add {
  { src = 'https://github.com/rebelot/kanagawa.nvim' },
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
  { src = 'https://github.com/shellRaining/hlchunk.nvim' },
  { src = 'https://github.com/NMAC427/guess-indent.nvim' },
  { src = 'https://github.com/folke/which-key.nvim' },
}

--- LSP
add {
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/williamboman/mason.nvim' },
  { src = 'https://github.com/williamboman/mason-lspconfig.nvim' },
  { src = 'https://github.com/stevearc/conform.nvim' },
}

-- Typescript
add {
  { src = 'https://github.com/dmmulroy/ts-error-translator.nvim' },
  { src = 'https://github.com/dmmulroy/tsc.nvim' },
  { src = 'https://github.com/pmizio/typescript-tools.nvim' },
}
-- Markdown
add {
  { src = 'https://github.com/obsidian-nvim/obsidian.nvim' },
  { src = 'https://github.com/MeanderingProgrammer/render-markdown.nvim' },
}

--- Blink
add {
  { src = 'https://github.com/Saghen/blink.cmp', version = vim.version.range '1.*' },
  { src = 'https://github.com/Saghen/blink.nvim', version = 'main' },
  { src = 'https://github.com/moyiz/blink-emoji.nvim' },
  { src = 'https://github.com/alexandre-abrioux/blink-cmp-npm.nvim' },
  { src = 'https://github.com/L3MON4D3/LuaSnip' },
  { src = 'https://github.com/rafamadriz/friendly-snippets' },
}

--- Database Management
add {
  { src = 'https://github.com/tpope/vim-dadbod' },
  { src = 'https://github.com/kristijanhusak/vim-dadbod-ui' },
  { src = 'https://github.com/kristijanhusak/vim-dadbod-completion' },
}

--- File Explorer / Navigation
add {
  -- Oil
  { src = 'https://github.com/stevearc/oil.nvim' },
  { src = 'https://github.com/JezerM/oil-lsp-diagnostics.nvim' },
  -- Telescope
  { src = 'https://github.com/nvim-telescope/telescope.nvim' },
  { src = 'https://github.com/2KAbhishek/nerdy.nvim' },
}
