return {
  {
    'shellRaining/hlchunk.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      chunk = {
        enable = true,
        use_treesitter = true,
      },
      line_num = {
        enable = false,
        style = { fg = 'Background' },
      },
    },
  },
}
