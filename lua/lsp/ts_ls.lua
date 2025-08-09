local vue_ls_path = vim.fn.expand '~/.bun/bin/vue-language-server'
local tsserver_filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }

local vue_plugin = {
  name = '@vue/typescript-plugin',
  location = vue_ls_path,
  languages = { 'vue' },
  configNamespace = 'typescript',
}

--- vue_ls and ts_ls config
---@type vim.lsp.Config
local ts_ls_config = {
  init_options = {
    plugins = {
      vue_plugin,
    },
    filetypes = tsserver_filetypes,
  },
  root_markers = { 'package.json' },
  capabilities = require('blink.cmp').get_lsp_capabilities(),
}

local vue_ls_config = {}
vim.lsp.config('ts_ls', ts_ls_config)
vim.lsp.config('vue_ls', vue_ls_config)
vim.lsp.enable { 'ts_ls', 'vue_ls' }
