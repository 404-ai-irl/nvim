---@module "hover"
return {
  'lewis6991/hover.nvim',
  keys = {
    {
      'K',
      function()
        require('hover').open()
      end,
      desc = 'Hover',
    },
    {
      'gK',
      function()
        require('hover').select()
      end,
      desc = 'Hover Select',
    },
    {
      '<C-p>',
      function()
        require('hover').switch 'previous'
      end,
      desc = 'Previous Hover Source',
    },
    {
      '<C-n>',
      function()
        require('hover').switch 'next'
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
      border = '',
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

