vim.pack.add {
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/stevearc/conform.nvim' },
}

--- Auto Formatting ---
require('conform').setup {
  formatters_by_ft = {
    lua = { 'stylua' },
    rust = { 'rustfmt', lsp_format = 'fallback' },
    javascript = { 'biome', 'prettier', stop_after_first = true },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = 'fallback',
  },
}
--- LSP Configs ---
--- Lua
---@type vim.lsp.Config
local lua_ls_conf = {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {
          'vim',
          'require',
        },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
      },
      telemetry = { enable = false },
    },
  },
}

--- Typescript
vim.lsp.config('lua_ls', lua_ls_conf)
vim.lsp.config('ts_ls', {})
-- vim.lsp.config('vue_ls', vue_ls_config)
-- vim.lsp.config('vtlsls', vtsls_config)
vim.lsp.enable { 'lua_ls', 'ts_ls' }
