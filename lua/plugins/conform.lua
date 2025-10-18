return {'stevearc/conform.nvim', opts = {
  formatters_by_ft = {
    lua = { 'stylua' },
    javascript = { 'biome', 'prettier', stop_after_first = true },
    typescript = { 'biome', 'prettier', stop_after_first = true },
    javascriptreact = { 'biome', 'prettier', stop_after_first = true },
    typescriptreact = { 'biome', 'prettier', stop_after_first = true },
    svelte = { 'prettier' },
    html = { 'prettier' },
    css = { 'biome' },
    json = { 'biome' },
    yaml = { 'biome' },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = 'fallback',
  },
}}
