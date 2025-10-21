return {
  {
    'EdenEast/nightfox.nvim',
    opts = {
      options = {
        transparent = true,
        terminal_colors = true,
        colorblind = {
          enable = true,
          severity = {
            protan = 0.3,
            deutan = 0.6,
          },
        },
      },
    },
  },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      style = 'night',
      transparent = true,
      terminal_colors = true,
    },
  },
  {
    'rebelot/kanagawa.nvim',
    opts = {
      theme = 'dragon',
      transparent = true,
      commentStyle = { italic = true },
    },
  },
  {
    'brenoprata10/nvim-highlight-colors',
    event = 'VeryLazy',
    opts = { render = 'virtual', enable_tailwind = true },
  },
}
