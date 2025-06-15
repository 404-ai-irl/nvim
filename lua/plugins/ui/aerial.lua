return {
  'stevearc/aerial.nvim',
  -- @types aerial
  opts = {
    layout = {
      min_width = 10,
      width = nil,
      max_width = { 40, 0.2 },
    },
    default_direction = 'left',
  },
  -- Optional dependencies
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
}
