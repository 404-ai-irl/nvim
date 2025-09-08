require('oil-lsp-diagnostics').setup()
require('oil').setup {
  default_file_explorer = true,
  constrain_cursor = 'editable',
  columns = { 'mtime', 'icon' },
  skip_confirm_for_simple_edits = true,
  float = {
    border = 'bold',
    max_width = 0.6,
    max_height = 0.6,
  },
}

vim.keymap.set('n', '_', '<cmd>Oil --float<cr>', { desc = 'Open Oil floating buffer' })
vim.keymap.set('n', '-', '<cmd>Oil<cr>', { desc = 'Open Oil in (v)split buffer' })
