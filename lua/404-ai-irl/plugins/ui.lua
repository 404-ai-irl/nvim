return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {
    presets = {
      bottom_search = false,
    },
    routes = {
      {
        view = 'notify',
        filter = { event = 'msg_showmode' },
      },
    },
    cmdline = { enabled = true },
    views = {
      cmdline_popup = {
        border = {
          style = 'none',
          padding = { 2, 3 },
        },
        filter_options = {},
        win_options = {
          winhighlight = 'NormalFloat:NormalFloat,FloatBorder:FloatBorder',
        },
      },
    },
  },
  dependencies = {
    'MunifTanjim/nui.nvim',
  },
  {
    'EdenEast/nightfox.nvim',
    colorscheme = { 'carbonfox' },
    opts = {
      options = {
        transparent = true,
        terminal_colors = true,
        colorblind = {
          enable = true,
          severity = {
            protan = 0.2,
            deutan = 0.6,
          },
        },
      },
    },
  },

  {
    'brenoprata10/nvim-highlight-colors',
    event = 'VeryLazy',
    opts = { render = 'virtual', enable_tailwind = true },
  },
}
