--- Toggle Highlights
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
--- Diagnostics
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

--- TODO: Add bdelete command
vim.keymap.set('n', '<leader>bx', function()
  vim.cmd 'bdelete'
end, { desc = 'Delete buffer' })

--- Window Navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<C-S-h>', '<C-w>H', { desc = 'Move window to the left' })
vim.keymap.set('n', '<C-S-l>', '<C-w>L', { desc = 'Move window to the right' })
vim.keymap.set('n', '<C-S-j>', '<C-w>J', { desc = 'Move window to the lower' })
vim.keymap.set('n', '<C-S-k>', '<C-w>K', { desc = 'Move window to the upper' })

vim.keymap.set('i', 'jj', '<Esc>', { desc = 'JJ Esc' })
vim.keymap.set('i', 'jk', '<Esc>', { desc = 'JK Esc' })

--- Obsidian
vim.keymap.set('n', '<leader>on', ':Obsidian new<CR>', { desc = 'New note' })
vim.keymap.set('n', '<leader>oo', ':Obsidian open<CR>', { desc = 'Open note' })
vim.keymap.set('n', '<leader>os', ':Obsidian search<CR>', { desc = 'Search notes' })
vim.keymap.set('n', '<leader>oq', ':Obsidian quick_switch<CR>', { desc = 'Quick switch' })
vim.keymap.set('n', '<leader>od', ':Obsidian today<CR>', { desc = "Today's note" })
vim.keymap.set('n', '<leader>oy', ':Obsidian yesterday<CR>', { desc = "Yesterday's note" })
vim.keymap.set('n', '<leader>ot', ':Obsidian tags<CR>', { desc = 'List tags' })
vim.keymap.set('n', '<leader>ob', ':Obsidian backlinks<CR>', { desc = 'Show backlinks' })
vim.keymap.set('n', '<leader>ol', ':Obsidian links<CR>', { desc = 'Show links' })
vim.keymap.set('n', '<leader>of', ':Obsidian follow_link<CR>', { desc = 'Follow link under cursor' })
vim.keymap.set('n', '<leader>or', ':Obsidian rename<CR>', { desc = 'Rename note' })
vim.keymap.set('n', '<leader>oi', ':Obsidian template<CR>', { desc = 'Insert template' })
vim.keymap.set('v', '<leader>ol', ':Obsidian link<CR>', { desc = 'Link selection' })
vim.keymap.set('v', '<leader>on', ':Obsidian link_new<CR>', { desc = 'Create note from selection' })
-- Markdown preview
vim.keymap.set('n', '<leader>mp', ':MarkdownPreviewToggle<CR>', { desc = 'Toggle markdown preview' })
