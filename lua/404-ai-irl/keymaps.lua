--- General Keymaps
-- Leave insert mode ( jj / jk )
vim.keymap.set('i', 'jj', '<Esc>', { desc = 'JJ Esc' })
vim.keymap.set('i', 'jk', '<Esc>', { desc = 'JK Esc' })
-- Toggle Highlights
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Escape to clear search highlight' })

--- Window / Panes
-- Navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
-- Move Windows
vim.keymap.set('n', '<C-S-h>', '<C-w>H', { desc = 'Move window to the left' })
vim.keymap.set('n', '<C-S-l>', '<C-w>L', { desc = 'Move window to the right' })
vim.keymap.set('n', '<C-S-j>', '<C-w>J', { desc = 'Move window to the lower' })
vim.keymap.set('n', '<C-S-k>', '<C-w>K', { desc = 'Move window to the upper' })

--- Dial
vim.keymap.set('n', '<C-a>', function()
  require('dial.map').manipulate('increment', 'normal')
end)
vim.keymap.set('n', '<C-x>', function()
  require('dial.map').manipulate('decrement', 'normal')
end)
vim.keymap.set('n', 'g<C-a>', function()
  require('dial.map').manipulate('increment', 'gnormal')
end)
vim.keymap.set('n', 'g<C-x>', function()
  require('dial.map').manipulate('decrement', 'gnormal')
end)
vim.keymap.set('v', '<C-a>', function()
  require('dial.map').manipulate('increment', 'visual')
end)
vim.keymap.set('v', '<C-x>', function()
  require('dial.map').manipulate('decrement', 'visual')
end)
vim.keymap.set('v', 'g<C-a>', function()
  require('dial.map').manipulate('increment', 'gvisual')
end)
vim.keymap.set('v', 'g<C-x>', function()
  require('dial.map').manipulate('decrement', 'gvisual')
end)
