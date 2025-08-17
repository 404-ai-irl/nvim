--- Note: this config only works with nvim 0.12+
if vim.fn.has 'nvim-0.11' == 0 then
  vim.notify('Neovim 0.12+ required', vim.log.levels.ERROR)
  return
end

-- Global Treesitter Settings
vim.g._ts_force_sync_parsing = true

-- Activate Nvim Experimental UI
require('vim._extui').enable {}

--- A wrapper around the vim.pack.add command
local add = function(specs)
  specs = vim
    .iter(specs)
    :map(function(s)
      local spec = type(s) == 'string' and { src = s } or s

      if not spec.src:match '^https?' and not spec.src:match '^/' then
        spec.src = 'https://github.com/' .. spec.src
      end

      return spec
    end)
    :totable()
  vim.pack.add(specs)
end

add {
  --- Libraries
  { src = 'nvim-lua/plenary.nvim' },
  { src = 'echasnovski/mini.nvim' },
  { src = 'folke/snacks.nvim' },
  -- Treesitter
  { src = 'nvim-treesitter/nvim-treesitter', version = 'master' },
  { src = 'nvim-treesitter/nvim-treesitter-context' },
  { src = 'nvim-treesitter/nvim-treesitter-textobjects' },
  { src = 'windwp/nvim-ts-autotag' },
  -- Mason + LspConfig
  { src = 'neovim/nvim-lspconfig' },
  { src = 'williamboman/mason.nvim' },
  { src = 'williamboman/mason-lspconfig.nvim' },
  -- Formatting + Cmp
  { src = 'stevearc/conform.nvim' },
  { src = 'Saghen/blink.cmp', version = vim.version.range '1.*' },
  { src = 'Saghen/blink.nvim', version = 'main' },
  { src = 'moyiz/blink-emoji.nvim' },
  { src = 'alexandre-abrioux/blink-cmp-npm.nvim' },
  { src = 'onsails/lspkind.nvim' },
  -- Snippets
  { src = 'L3MON4D3/LuaSnip' },
  { src = 'rafamadriz/friendly-snippets' },
  --- UI
  { src = 'MunifTanjim/nui.nvim' },
  { src = 'shellRaining/hlchunk.nvim' },
  { src = 'NMAC427/guess-indent.nvim' },
  { src = 'nvim-tree/nvim-web-devicons' },
  { src = 'rebelot/kanagawa.nvim' },
  { src = 'j-hui/fidget.nvim' },
  { src = 'folke/which-key.nvim' },
  { src = 'akinsho/bufferline.nvim', version = vim.version.range '*' },
  { src = 'lewis6991/gitsigns.nvim' },
  --- Development
  { src = 'stevearc/conform.nvim' },
  { src = 'folke/trouble.nvim' },
  { src = 'mfussenegger/nvim-lint' },
  { src = 'gbprod/substitute.nvim' },
  -- Git
  { src = 'tpope/vim-fugitive' },
  -- Dap
  { src = 'mfussenegger/nvim-dap' },
  { src = 'igorlfs/nvim-dap-view' },
  -- Oil
  { src = 'stevearc/oil.nvim' },
  { src = 'JezerM/oil-lsp-diagnostics.nvim' },
  -- Telescope
  { src = 'nvim-telescope/telescope.nvim' },
  { src = 'nvim-telescope/telescope-fzy-native.nvim' },
  { src = '2KAbhishek/nerdy.nvim' },
  -- Database Management
  { src = 'tpope/vim-dadbod' },
  { src = 'kristijanhusak/vim-dadbod-ui' },
  { src = 'kristijanhusak/vim-dadbod-completion' },
  -- Markdown
  { src = 'obsidian-nvim/obsidian.nvim' },
  { src = 'MeanderingProgrammer/render-markdown.nvim' },
}

vim.schedule(function()
  vim.cmd.colorscheme 'kanagawa-dragon'
end)

require '404-ai-irl'
