require('oil-lsp-diagnostics').setup()
require('oil').setup {
  default_file_explorer = true,
  constrain_cursor = 'editable',
  columns = { 'mtime', 'icon' },
  float = {
    max_width = 0.6,
    max_height = 0.6,
  },
}

vim.keymap.set('n', '-', '<cmd>Oil --float<cr>', { desc = 'Open Oil floating buffer' })
vim.keymap.set('n', '_', '<cmd>Oil --split<cr>', { desc = 'Open Oil in (v)split buffer' })
