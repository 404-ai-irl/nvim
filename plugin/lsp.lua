---@class lazydev.Config
local lazydev_conf = {
  library = {
    { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
  },
}
--- Mason Config
---@class MasonSettings
local mason_config = {
  PATH = 'prepend',
  max_concurrent_installers = 6,
  check_outdated_packages_on_open = true,
  ui = {
    backdrop = 36,
    border = 'rounded',
    height = 0.8,
    width = 0.7,
    icons = {
      package_installed = ' ',
      package_pending = ' ',
      package_uninstalled = '󱂥 ',
    },
  },
}

--- @class MasonLspconfigSettings
local lsp_config = {
  -- Automatically install these language servers
  ensure_installed = {
    'lua_ls',
    'ts_ls',
    'biome',
    'tailwindcss',
    'html',
    'cssls',
    'jsonls',
    'yamlls',
  },
  automatic_installation = true,
}


require('lazydev').setup(lazydev_conf)
require('mason').setup(mason_config)
require('mason-lspconfig').setup(lsp_config)

--- Auto Formatting with Conform ---
require('conform').setup {
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
}
