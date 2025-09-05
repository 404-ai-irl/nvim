--- Mason Config
---@class MasonSettings
local mason_config = {
  PATH = 'prepend',
  max_concurrent_installers = 6,
  check_outdated_packages_on_open = true,
  ui = {
    backdrop = 36,
    border = nil,
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

require('mason').setup(mason_config)
require('mason-lspconfig').setup(lsp_config)

--- Lint Config ---
local lint = require 'lint'
lint.linters_by_ft = {}

--- Auto Commands ---
local lint_group = vim.api.nvim_create_augroup('tbone.lint', { clear = true })
local makeAutoCmd = vim.api.nvim_create_autocmd
-- Autolint
vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  group = lsp_group,
  callback = function()
    -- configured with `linters_by_ft` above
    require('lint').try_lint()
    -- for specific/custom linters
    -- require('lint').try_lint('the_linter')
  end,
})

-- Biome Code Actions
-- vim.api.nvim_create_autocmd('BufWritePre', {
--   callback = function() end,
-- })

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
