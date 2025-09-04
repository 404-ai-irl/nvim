--- Mason Config
---@class MasonSettings
local mason_config = {
  PATH = 'prepend',
  max_concurrent_installers = 6,
  check_outdated_packages_on_open = true,
  ui = {
    backdrop = 36,
    border = 'round',
    height = 0.8,
    width = 0.7,
    icons = {
      package_installed = '',
      package_pending = ' ',
      package_uninstalled = '',
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

require('plugin.mason').setup(mason_config)
require('mason-lspconfig').setup(lsp_config)
