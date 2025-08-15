local add = vim.pack.add

--- Initial Plugins
add {
  -- Dependencies
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/MunifTanjim/nui.nvim' },
  { src = 'https://github.com/rcarriga/nvim-notify' },
  -- Theme
  { src = 'https://github.com/rebelot/kanagawa.nvim' },
  -- Icons
  { src = 'https://github.com/echasnovski/mini.icons' },
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
  -- Indents / Highlighting
  { src = 'https://github.com/shellRaining/hlchunk.nvim' },
  { src = 'https://github.com/NMAC427/guess-indent.nvim' },
  -- Keymap UI
  { src = 'https://github.com/folke/which-key.nvim' },
}

--- Set notify-nvim as default notification system
vim.notify = require 'notify'

--- Development
add {
  -- Treesitter
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'master' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter-context' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects' },
  { src = 'https://github.com/windwp/nvim-ts-autotag' },
  -- Markdown
  { src = 'https://github.com/obsidian-nvim/obsidian.nvim' },
  { src = 'https://github.com/MeanderingProgrammer/render-markdown.nvim' },
  -- Database Management
  { src = 'https://github.com/tpope/vim-dadbod' },
  { src = 'https://github.com/kristijanhusak/vim-dadbod-ui' },
  { src = 'https://github.com/kristijanhusak/vim-dadbod-completion' },
}

--- Navigation / Movement
add {
  -- Oil
  { src = 'https://github.com/stevearc/oil.nvim' },
  { src = 'https://github.com/JezerM/oil-lsp-diagnostics.nvim' },
  -- Telescope
  { src = 'https://github.com/nvim-telescope/telescope.nvim' },
  { src = 'https://github.com/nvim-telescope/telescope-fzy-native.nvim' },
  { src = 'https://github.com/2KAbhishek/nerdy.nvim' },
}
