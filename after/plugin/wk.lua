local wk = require 'which-key'
---@type wk.Opts
local options = {
  preset = 'modern',
  delay = function(ctx)
    return ctx.operator and 0 or 200
  end,
  expand = 0, -- Reduce expand to avoid clutter
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
    group = '+', -- symbol prepended to a group
  },
  spec = {
    -- Core groups
    { '<leader>b', group = 'Buffer', icon = '󰓩' },
    { '<leader>d', group = 'Database', icon = '󰆼' },
    { '<leader>g', group = 'Git', icon = '󰊢' },
    { '<leader>l', group = 'LSP', icon = '󰒲' },
    { '<leader>o', group = 'Obsidian', icon = '󰇈' },
    { '<leader>m', group = 'Markdown', icon = '󰽛' },
    { '<leader>w', group = 'Window', icon = '󰖲' },
  },
}

wk.setup { options }

--- Window / Panes
-- Navigation
wk.add {}

-- Move Windows
vim.keymap.set('n', '<C-S-h>', '<C-w>H', { desc = 'Move window to the left' })
vim.keymap.set('n', '<C-S-l>', '<C-w>L', { desc = 'Move window to the right' })
vim.keymap.set('n', '<C-S-j>', '<C-w>J', { desc = 'Move window to the lower' })
vim.keymap.set('n', '<C-S-k>', '<C-w>K', { desc = 'Move window to the upper' })

-- Markdown preview
vim.keymap.set('n', '<leader>tm', ':MarkdownPreviewToggle<CR>', { desc = 'Toggle markdown preview' })
-- Add all keybindings with proper grouping and descriptions
wk.add {
  -- Buffer management
  {
    '<leader>bx',
    function()
      vim.cmd 'bdelete'
    end,
    desc = '󰅖 Delete buffer',
  },
  -- Database
  { '<leader>du', desc = '󰆼 Toggle DBUI' },
  { '<leader>df', desc = '󰍉 Find DB buffer' },
  { '<leader>dr', desc = '󰑕 Rename DB buffer' },
  { '<leader>dq', desc = '󰋖 Last query info' },

  -- LSP
  { 'gd', desc = 'Go to definition' },
  { 'gD', desc = 'Go to declaration' },
  { 'gr', desc = 'Go to references' },
  { 'gi', desc = 'Go to implementation' },
  { 'K', desc = '󰋖 Hover documentation' },
  { '<leader>rn', desc = '󰑕 Rename symbol' },
  { '<leader>ca', desc = '󰌵 Code actions' },
  { '<leader>D', desc = 'Type definition' },
  { '<leader>q', desc = '󰁨 Diagnostics to quickfix' },
  { '<leader>e', desc = '󰒒 Show diagnostic' },
  { '[d', desc = '⬆ Previous diagnostic' },
  { ']d', desc = '⬇ Next diagnostic' },

  -- Obsidian notes

  -- Terminal (defined in autocmd)
  { '<esc>', desc = 'Exit terminal mode', mode = 't' },
  { '<C-h>', desc = '← Move focus left', mode = 't' },
  { '<C-j>', desc = '↓ Move focus down', mode = 't' },
  { '<C-k>', desc = '↑ Move focus up', mode = 't' },
  { '<C-l>', desc = '→ Move focus right', mode = 't' },
}
