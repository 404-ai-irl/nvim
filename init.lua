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

--- NOTE Completed

--- TODO Complete plugin updates
add {
  ---TODO Testing
  { src = 'nvimtools/hydra.nvim' },
  { src = 'lewis6991/hover.nvim' },
  { src = 'jbyuki/venn.nvim' },
  -- Vim Pack Mods, pick one?
  --- NOTE need setup
  { src = 'L3MON4D3/LuaSnip' },
  { src = 'rafamadriz/friendly-snippets' },
  --- NOTE configuration review
  { src = 'coder/claudecode.nvim' },
  { src = 'onsails/lspkind.nvim' },
  { src = 'alexandre-abrioux/blink-cmp-npm.nvim' },
  --- depricating
  { src = 'folke/snacks.nvim' }, -- TODO depricated
  { src = 'folke/which-key.nvim' }, -- mini.hint?
  { src = 'sschleemilch/slimline.nvim' }, -- lualine or custom?
  { src = 'akinsho/bufferline.nvim', version = vim.version.range '*' }, --bloat?
}

add {
  { src = 'adriankarlen/plugin-view.nvim' }, -- Plugin updates
  { src = 'folke/lazydev.nvim' }, -- Lua development
  { src = 'stevearc/conform.nvim' }, -- Formatting
  { src = 'mfussenegger/nvim-lint' }, -- Linting
  { src = 'tpope/vim-fugitive' }, -- Git
  -- Lsp
  { src = 'neovim/nvim-lspconfig' },
  { src = 'williamboman/mason.nvim' },
  { src = 'williamboman/mason-lspconfig.nvim' },
  -- Mini
  { src = 'echasnovski/mini.ai' },
  { src = 'echasnovski/mini.surround' },
  -- Blink
  { src = 'Saghen/blink.cmp' },
  { src = 'Saghen/blink.nvim' },
  -- Treesitter
  { src = 'nvim-treesitter/nvim-treesitter', version = 'master' },
  { src = 'nvim-treesitter/nvim-treesitter-context' },
  { src = 'nvim-treesitter/nvim-treesitter-textobjects' },
  { src = 'JoosepAlviste/nvim-ts-context-commentstring' },
  { src = 'windwp/nvim-ts-autotag' },
  --- Telescope
  { src = 'nvim-telescope/telescope.nvim' },
  { src = 'nvim-telescope/telescope-fzf-native.nvim' },
  --- UI
  { src = 'nvim-tree/nvim-web-devicons' },
  { src = 'j-hui/fidget.nvim' },
  { src = 'rebelot/kanagawa.nvim' },
  { src = 'shellRaining/hlchunk.nvim' },
  { src = 'NMAC427/guess-indent.nvim' },
  { src = 'numToStr/Comment.nvim' },
  --- Extras
  { src = 'stevearc/oil.nvim' },
  { src = 'JezerM/oil-lsp-diagnostics.nvim' },
  { src = 'monaqa/dial.nvim' },
  { src = 'tpope/vim-dadbod' },
  { src = 'kristijanhusak/vim-dadbod-ui' },
  { src = 'kristijanhusak/vim-dadbod-completion' },
  { src = 'MeanderingProgrammer/render-markdown.nvim' },
  -- Dependencies
  { src = 'nvim-lua/plenary.nvim' },
  { src = 'rcarriga/nvim-notify' },
  { src = 'MunifTanjim/nui.nvim' },
}

vim.schedule(function()
  vim.cmd.colorscheme 'kanagawa-dragon'
  require('notify').setup()
  require('fidget').setup {}
  require '404-ai-irl'
end)
