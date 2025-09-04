--- WARNING: this config only works with nvim 0.12+
if vim.fn.has 'nvim-0.11' == 0 then
  vim.notify('Neovim 0.12+ required', vim.log.levels.ERROR)
  return
end

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

--- Note Completed

--- TODO Complete plugin updates
add {
  --- NOTE New Plugins being tested
  { src = 'nvimtools/hydra.nvim' },
  { src = 'lewis6991/hover.nvim' },
  --- NOTE Need setup
  { src = 'L3MON4D3/LuaSnip' },
  { src = 'rafamadriz/friendly-snippets' },
  --- NOTE Need configuration review
  --- AI
  { src = 'coder/claudecode.nvim' },
  --- UI
  { src = 'Djancyp/better-comments.nvim' },
  --- LSP
  { src = 'onsails/lspkind.nvim' },
  { src = 'alexandre-abrioux/blink-cmp-npm.nvim' },
}

--- depricated? Old plugins up for deprication
add {
  { src = 'folke/snacks.nvim' }, -- NOTE replace with telescope or fff or fzf
  { src = 'folke/which-key.nvim' }, -- hydra?
  { src = 'sschleemilch/slimline.nvim' }, -- lualine or custom?
  { src = 'akinsho/bufferline.nvim', version = vim.version.range '*' }, --bloat?
}

add {
  -- Dependencies
  { src = 'nvim-lua/plenary.nvim' },
  { src = 'rcarriga/nvim-notify' },
  { src = 'MunifTanjim/nui.nvim' },
  -- Libraries
  { src = 'echasnovski/mini.nvim' },
}

add {
  -- Core UI
  { src = 'nvim-tree/nvim-web-devicons' },
  { src = 'j-hui/fidget.nvim' },
  { src = 'rebelot/kanagawa.nvim' },
  { src = 'shellRaining/hlchunk.nvim' },
  { src = 'NMAC427/guess-indent.nvim' },
}

--- LSP
add {
  -- Core Dev Plugins
  { src = 'neovim/nvim-lspconfig' },
  { src = 'williamboman/mason.nvim' },
  { src = 'williamboman/mason-lspconfig.nvim' },
  { src = 'folke/lazydev.nvim' },
  -- Treesitter
  { src = 'nvim-treesitter/nvim-treesitter', version = 'master' },
  { src = 'nvim-treesitter/nvim-treesitter-context' },
  { src = 'nvim-treesitter/nvim-treesitter-textobjects' },
  { src = 'windwp/nvim-ts-autotag' },
  -- Formatting
  { src = 'stevearc/conform.nvim' },
  -- Linting
  { src = 'mfussenegger/nvim-lint' },
  -- Completions
  { src = 'Saghen/blink.cmp', version = vim.version.range '1.*' },
  { src = 'Saghen/blink.nvim', version = 'main' },
}

--- Extras
add {
  -- Git
  { src = 'tpope/vim-fugitive' },
  -- Oil
  { src = 'stevearc/oil.nvim' },
  { src = 'JezerM/oil-lsp-diagnostics.nvim' },
  -- Dial
  { src = 'monaqa/dial.nvim' },
  -- Database Management
  { src = 'tpope/vim-dadbod' },
  { src = 'kristijanhusak/vim-dadbod-ui' },
  { src = 'kristijanhusak/vim-dadbod-completion' },
  -- Markdown / Notes
  { src = 'MeanderingProgrammer/render-markdown.nvim' },
}

--- NOTE deferred final setup
vim.schedule(function()
  vim.cmd.colorscheme 'kanagawa-dragon'
  require('notify').setup()
  require '404-ai-irl'
end)
