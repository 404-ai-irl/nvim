return {
  'stevearc/oil.nvim',
  dependencies = {
    { "nvim-mini/mini.icons", opts = {}} ,
    {'JezerM/oil-lsp-diagnostics.nvim', opts = {}}
  },
  lazy = false,
  keys = {
    { '-', '<cmd>Oil<cr>', desc = 'Open Oil in (v)split buffer' },
    { '_', '<cmd>Oil --float<cr>', desc = 'Open Oil floating buffer' },
  },
  opts = {
   default_file_explorer = true,
  constrain_cursor = 'editable',
  columns = { 'mtime', 'icon' },
  skip_confirm_for_simple_edits = true,
  float = {
    border = 'bold',
    max_width = 0.6,
    max_height = 0.6,
  },
  },
}
