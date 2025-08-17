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

    -- Window management
    { '<leader>wh', '<C-w><C-h>', desc = '← Move focus left' },
    { '<leader>wj', '<C-w><C-j>', desc = '↓ Move focus down' },
    { '<C-k>', desc = '↑ Move focus up' },
    { '<C-l>', desc = '→ Move focus right' },
    { '<C-S-h>', desc = '⇤ Move window left' },
    { '<C-S-j>', desc = '⇣ Move window down' },
    { '<C-S-k>', desc = '⇡ Move window up' },
    { '<C-S-l>', desc = '⇥ Move window right' },
  },
}
wk.setup { options }

wk.add {
  { '<leader>t', group = 'Toggle', icon = ' ' },
  { '<leader>th', '<cmd>nohlsearch<cr>', mode = 'n', group = 'Toggle', desc = 'Escape to clear search highlight' },
}

-- Toggle Highlights
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Escape to clear search highlight' })
-- Diagnostics
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
--- Buffers
-- Close Buffer
vim.keymap.set('n', '<leader>bx', function()
  vim.cmd 'bdelete'
end, { desc = 'Delete buffer' })

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
  -- Telescope (Find)
  { '<leader>ff', desc = '󰈞 Files' },
  { '<leader>fg', desc = '󰊄 Live grep' },
  { '<leader>fb', desc = 'Buffers', icon = '󰘦 ' },
  { '<leader>fh', desc = '󰋖 Help tags' },
  { '<leader>fs', desc = '󰜎 Symbols' },
  { '<leader>fn', desc = '󰔡 Nerd font glyphs' },

  -- Database
  { '<leader>du', desc = '󰆼 Toggle DBUI' },
  { '<leader>df', desc = '󰍉 Find DB buffer' },
  { '<leader>dr', desc = '󰑕 Rename DB buffer' },
  { '<leader>dq', desc = '󰋖 Last query info' },

  --
  { '<leader>wh', '<C-w><C-h>', mode = 'n', desc = 'Move focus to the left window' },
  { '<leader>wl', '<C-w><C-l>', mode = 'n', desc = 'Move focus to the right window' },
  { '<leader>wj', '<C-w><C-j>', mode = 'n', desc = 'Move focus to the lower window' },
  { '<leader>wk', '<C-w><C-k>', mode = 'n', desc = 'Move focus to the up' },
  -- LSP
  { 'gd', desc = 'Go to definition' },
  { 'gD', desc = 'Go to declaration' },
  { 'gr', desc = 'Go to references' },
  { 'gi', desc = 'Go to implementation' },
  { 'K', desc = '󰋖 Hover documentation' },
  { '<leader>rn', desc = '󰑕 Rename symbol' },
  { '<leader>ca', desc = '󰌵 Code actions' },
  { '<leader>D', desc = 'Type definition' },
  { '<leader>F', 'Conform', desc = '󰉼 Format code' },
  { '<leader>q', desc = '󰁨 Diagnostics to quickfix' },
  { '<leader>e', desc = '󰒒 Show diagnostic' },
  { '[d', desc = '⬆ Previous diagnostic' },
  { ']d', desc = '⬇ Next diagnostic' },

  -- Obsidian notes
  -- Markdown
  { '<leader>tm', desc = '󰽛 Toggle markdown preview' },

  -- Terminal (defined in autocmd)
  { '<esc>', desc = 'Exit terminal mode', mode = 't' },
  { '<C-h>', desc = '← Move focus left', mode = 't' },
  { '<C-j>', desc = '↓ Move focus down', mode = 't' },
  { '<C-k>', desc = '↑ Move focus up', mode = 't' },
  { '<C-l>', desc = '→ Move focus right', mode = 't' },
}
