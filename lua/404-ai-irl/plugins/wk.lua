local vset = vim.keymap.set
-- Leave insert mode ( jj / jk )
vset('i', 'jj', '<Esc>', { desc = 'JJ Esc' })
vset('i', 'jk', '<Esc>', { desc = 'JK Esc' })

return {
  'folke/which-key.nvim',
  event = 'VeryLazy',

  opts = {
    preset = 'modern',
    delay = function(ctx)
      return ctx.operator and 0 or 200
    end,
    expand = 2,
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
      breadcrumb = '»',
      separator = '-',
      group = '+',
    },
    spec = {
      { '<leader>a', group = 'AI', icon = '' },
      { '<leader>d', group = 'Database', icon = '󰆼' },
      { '<leader>f', group = 'Find', icon = '' },
      { '<leader>g', group = 'Git', icon = '󰊢' },
      { '<leader>l', group = 'LSP', icon = '' },
      { '<leader>la', vim.lsp.buf.code_action, desc = 'LSP Actions', icon = '󰒡' },
      { '<leader>s', group = 'Search', icon = '' },
      { '<leader>t', group = 'Toggle', icon = '' },
      { '<leader>w', group = 'Wiki', icon = '󱓷' },
      { '<leader>x', group = 'Trouble', icon = '󱖫' },
    },
  },
}
