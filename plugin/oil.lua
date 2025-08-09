vim.pack.add({ 'https://github.com/stevearc/oil.nvim' }, { 'https://github.com/JezerM/oil-lsp-diagnostics.nvim' })

require('oil').setup {
  columns = { 'ctime', 'mtime', 'icon' },
  float = {
    max_width = 0.6,
    max_height = 0.6,
  },
}

vim.keymap.set('n', '-', '<cmd>Oil --float<cr>')
