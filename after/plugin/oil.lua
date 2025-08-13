require('oil').setup {
  columns = { 'mtime', 'icon' },
  float = {
    max_width = 0.6,
    max_height = 0.6,
  },
}

vim.keymap.set('n', '-', '<cmd>Oil --float<cr>')
