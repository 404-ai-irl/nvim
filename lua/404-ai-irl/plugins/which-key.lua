-- Plugin: folke/which-key.nvim
-- Installed via store.nvim

return {
  'folke/which-key.nvim',
  event = 'VeryLazy',

  opts = {
    preset = 'modern',
    delay = function(ctx)
      return ctx.operator and 0 or 200
    end,
    expand = 2, -- Reduce expand to avoid clutter
    notify = true,
    replace = {
      key = {
        { '<Space>', 'SPACE' },
        { '<cr>', 'RET' },
        { '<tab>', 'TAB' },
        { '<BS>', 'BSPC' },
      },
    },
    icons = {
      breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
      separator = '-', -- symbol used between a key and it's label
      goup = '+', -- symbol prepended to a group
    },
    spec = {
      -- Core groups
      { '<leader>g', group = 'Git', icon = '󰊢' },
      { '<leader>t', group = 'Toggle' },
      { '<leader>l', group = 'Diagnostics', icon = '󰒡' },
      { '<leader>a', group = 'AI', icon = '󰒡' },
      { '<leader>d', group = 'Database', icon = '󰆼' },
    },
  },
}

