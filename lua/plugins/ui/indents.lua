return {
  {
    'shellRaining/hlchunk.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('hlchunk').setup {
        chunk = {
          enable = true,
          use_treesitter = true,
        },
        indent = {
          enable = false,
          use_treesitter = true,
          chars = {
            '│',
            '¦',
            '┆',
            '┊',
          },
        },
        line_num = {
          enable = true,
        },
        blank = {
          enable = false,
          chars = { '󱕆' },
          style = { fg = 'Background' },
        },
      }
    end,
  },
  'NMAC427/guess-indent.nvim',
}
