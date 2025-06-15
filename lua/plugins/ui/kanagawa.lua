return {
  'rebelot/kanagawa.nvim',
  lazy = false,
  priority = 1000,

  opts = {
    transparent = true,
    dimInactive = true,
    terminalColors = true,
    colors = {
      palette = {},
      theme = {
        wave = {},
        lotus = {},
        dragon = {},
        all = {
          ui = {
            bg_gutter = 'none',
          },
        },
      },
    },
  },

  config = function()
    vim.cmd 'colorscheme kanagawa-dragon'
  end,
}
