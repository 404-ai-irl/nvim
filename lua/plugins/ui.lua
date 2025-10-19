return {
  { 'j-hui/fidget.nvim' },
  {
    'shellRaining/hlchunk.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('hlchunk').setup {
        chunk = {
          enable = true,
          use_treesitter = true,
        },
        line_num = {
          enable = false,
          style = { fg = 'Background' },
        },
      }
    end,
  },
}

