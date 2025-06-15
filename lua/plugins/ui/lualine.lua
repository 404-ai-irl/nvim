return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diagnostics' },
      lualine_c = { 'filename' },
      lualine_x = {},
      lualine_y = { 'location', 'progress' },
      lualine_z = { 'fileformat', 'filetype' },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = { 'diff' },
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { 'encoding' },
    },
  },
}
