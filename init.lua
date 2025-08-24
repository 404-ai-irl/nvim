--- Note: this config only works with nvim 0.12+
if vim.fn.has 'nvim-0.11' == 0 then
  vim.notify('Neovim 0.12+ required', vim.log.levels.ERROR)
  return
end

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
  -- Dependencies
  { src = 'nvim-lua/plenary.nvim' },
  { src = 'rcarriga/nvim-notify' },
  { src = 'MunifTanjim/nui.nvim' },
  -- Libraries
  { src = 'echasnovski/mini.nvim' },
  { src = 'folke/snacks.nvim' },
  -- Core UI
  { src = 'sschleemilch/slimline.nvim' },
  { src = 'j-hui/fidget.nvim' },
  { src = 'nvim-tree/nvim-web-devicons' },
  { src = 'folke/which-key.nvim' },
  { src = 'rebelot/kanagawa.nvim' },
  { src = 'shellRaining/hlchunk.nvim' },
  { src = 'NMAC427/guess-indent.nvim' },
  { src = 'akinsho/bufferline.nvim', version = vim.version.range '*' },
}

add {
  -- Mason + LspConfig
  { src = 'neovim/nvim-lspconfig' },
  { src = 'williamboman/mason.nvim' },
  { src = 'williamboman/mason-lspconfig.nvim' },
  { src = 'folke/lazydev.nvim' },
  -- Treesitter
  { src = 'nvim-treesitter/nvim-treesitter', version = 'master' },
  { src = 'nvim-treesitter/nvim-treesitter-context' },
  { src = 'nvim-treesitter/nvim-treesitter-textobjects' },
  { src = 'windwp/nvim-ts-autotag' },
}

add {
  -- Formatting + Cmp
  { src = 'Saghen/blink.cmp', version = vim.version.range '1.*' },
  { src = 'Saghen/blink.nvim', version = 'main' },
  { src = 'moyiz/blink-emoji.nvim' },
  { src = 'alexandre-abrioux/blink-cmp-npm.nvim' },
  { src = 'onsails/lspkind.nvim' },
  { src = 'stevearc/conform.nvim' },
  -- Snippets
  { src = 'L3MON4D3/LuaSnip' },
  { src = 'rafamadriz/friendly-snippets' },
  --- AI
  { src = 'coder/claudecode.nvim' },
  --- Development
  { src = 'mfussenegger/nvim-lint' },
  -- Git
  { src = 'tpope/vim-fugitive' },
  -- Dap
  { src = 'mfussenegger/nvim-dap' },
  { src = 'igorlfs/nvim-dap-view' },
  -- Oil + Dial
  { src = 'monaqa/dial.nvim' },
  { src = 'stevearc/oil.nvim' },
  { src = 'JezerM/oil-lsp-diagnostics.nvim' },
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
  require('notify').setup()
  require '404-ai-irl'
end)
