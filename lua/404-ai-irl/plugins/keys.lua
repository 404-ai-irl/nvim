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
      -- Groups
      { '<leader>d', group = 'Database', icon = '󰆼' },
      { '<leader>f', group = 'Find', icon = '󰈞' },
      { '<leader>g', group = 'Git', icon = '󰊢' },
      { '<leader>l', group = 'LSP', icon = '' },
      { '<leader>s', group = 'Search', icon = '󰺮' },
      { '<leader>t', group = 'Toggle', icon = '󰨚' },
      { '<leader>w', group = 'Wiki', icon = '󰖬' },
      { '<leader>x', group = 'Trouble', icon = '󰒡' },
      { '<leader>la', vim.lsp.buf.code_action, desc = 'LSP Actions', icon = '󰌵' },
      -- Core picker operations
      { '<leader><space>', icon = '󰈞' },
      { '<leader>,', icon = '󰈙' },
      { '<leader>/', icon = '󰺮' },
      { '<leader>:', icon = '󰋚' },
      -- Find operations
      { '<leader>fb', icon = '󰈙' },
      { '<leader>fc', icon = '' },
      { '<leader>ff', icon = '󰈞' },
      { '<leader>fg', icon = '󰊢' },
      { '<leader>fr', icon = '󰋚' },
      -- Git operations
      { '<leader>gb', icon = '󰘬' },
      { '<leader>gl', icon = '󰜘' },
      { '<leader>gs', icon = '󰊢' },
      -- Search operations
      { '<leader>sb', icon = '󰍉' },
      { '<leader>sg', icon = '󰺮' },
      { '<leader>sw', icon = '󰬴' },
      { '<leader>sc', icon = '󰋚' },
      { '<leader>sC', icon = '' },
      { '<leader>sd', icon = '󰒡' },
      { '<leader>sh', icon = '󰋖' },
      { '<leader>sk', icon = '󰌌' },
      { '<leader>sR', icon = '󰁯' },
      { '<leader>ss', icon = '󰒕' },
      { '<leader>sS', icon = '󰒕' },
      -- LSP operations
      { 'gd', icon = '󰈮' },
      { 'gr', icon = '󰌹' },
      { 'gI', icon = '󰳽' },
      { 'gy', icon = '󰊄' },
      { '<leader>om', '<cmd>RenderMarkdown toggle<cr>', desc = 'Toggle Markdown Rendering', icon = '󰍔' },
      -- Trouble keybinds
      { '<leader>xx', icon = '󰒡' },
      { '<leader>xX', icon = '󰒡' },
      { '<leader>xs', icon = '󰒕' },
      { '<leader>xl', icon = '󰌹' },
      { '<leader>xL', icon = '󰂖' },
      { '<leader>xq', icon = '󰁨' },
      -- File manager keybinds
      { '-', icon = '󰏇' },
      { '_', icon = '󰏇' },
      { '<leader>-', icon = '󰇥' },
      { '<leader>cw', icon = '󰉓' },
      { '<c-up>', icon = '󰁯' },
      -- Hover keybinds
      { 'K', icon = '󰋖' },
      { 'gK', icon = '󰒕' },
      -- Blink keybinds
      { '<C-;>', icon = '󰿨' },
    },
  },
}
