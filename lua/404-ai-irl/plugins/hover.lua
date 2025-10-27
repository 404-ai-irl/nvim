return {
  'lewis6991/hover.nvim',
  keys = {
    {
      'K',
      function()
        require('hover').hover()
      end,
      desc = 'Hover',
    },
    {
      'gK',
      function()
        require('hover').hover_select()
      end,
      desc = 'Hover Select',
    },
    {
      '<C-p>',
      function()
        require('hover').hover_switch 'previous'
      end,
      desc = 'Previous Hover Source',
    },
    {
      '<C-n>',
      function()
        require('hover').hover_switch 'next'
      end,
      desc = 'Next Hover Source',
    },
  },
  opts = {
    init = function()
      require 'hover.providers.lsp'
      require 'hover.providers.diagnostic'
      require 'hover.providers.man'
      require 'hover.providers.dictionary'
      require 'hover.providers.gh'
      require 'hover.providers.gh_user'
    end,
    preview_opts = {
      border = 'single',
    },
    preview_window = false,
    title = true,
    mouse_providers = {
      'LSP',
      'diagnostic',
    },
    mouse_delay = 1000,
  },
}
