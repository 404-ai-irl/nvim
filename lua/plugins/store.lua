return {
  'alex-popov-tech/store.nvim',
  dependencies = { 'OXY2DEV/markview.nvim' },
  cmd = 'Store',
  config = function()
    -- Check terminal dimensions before setup
    local cols = vim.o.columns
    local lines = vim.o.lines

    if cols < 85 or lines < 18 then
      vim.notify(
        string.format(
          'store.nvim requires minimum 85x18 terminal size (current: %dx%d). Use :Store command in a larger terminal.',
          cols, lines
        ),
        vim.log.levels.WARN
      )
      return
    end

    require('store').setup {}
  end,
}