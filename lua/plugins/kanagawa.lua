return {
  'rebelot/kanagawa.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('kanagawa').setup {}
    vim.schedule(function()
      vim.cmd.colorscheme 'kanagawa-dragon'
    end)
  end,
}