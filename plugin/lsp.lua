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
  capabilities = require('blink.cmp').get_lsp_capabilities(),
}

--- Typescript
local ts_ls_filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }
-- vue plugin
local vue_ls_path = vim.fn.expand '~/.bun/bin/vue-language-server'
local vue_plugin = {
  name = '@vue/typescript-plugin',
  location = vue_ls_path,
  languages = { 'vue' },
  configNamespace = 'typescript',
}
---@type vim.lsp.Config
local ts_ls_config = {
  init_options = {
    plugins = {
      vue_plugin,
    },
    filetypes = ts_ls_filetypes,
  },
  root_markers = { 'package.json' },
  capabilities = require('blink.cmp').get_lsp_capabilities(),
}
-- vue_ls
---@type vim.lsp.Config
local vue_ls_config = {
  capabilities = require('blink.cmp').get_lsp_capabilities(),
}

vim.lsp.config('lua_ls', lua_ls_conf)
vim.lsp.config('ts_ls', ts_ls_config)
vim.lsp.config('vue_ls', vue_ls_config)
vim.lsp.enable { 'lua_ls', 'ts_ls', 'vue_ls' }
