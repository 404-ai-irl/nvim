--- LSP Diagnostics Configuration ---
vim.diagnostic.config {
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚',
      [vim.diagnostic.severity.WARN] = '󰀪',
      [vim.diagnostic.severity.INFO] = '󰋽',
      [vim.diagnostic.severity.HINT] = '󰌶',
    },
  },
  virtual_text = {
    prefix = '●',
    spacing = 4,
  },
  float = {
    focusable = false,
    border = 'rounded',
    source = true,
    header = '',
    prefix = '',
  },
  severity_sort = true,
  update_in_insert = false,
}
