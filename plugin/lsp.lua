--- Mason Config
---@type MasonSettings
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
require('mason').setup(mason_config)

--- Mason Lsp Config Settings
--- @type MasonLspconfigSettings
require('mason-lspconfig').setup {
  -- Automatically install these language servers
  ensure_installed = {
    'lua_ls',
    'ts_ls',
    'biome',
    'vue_ls',
    'tailwindcss',
    'html',
    'cssls',
    'jsonls',
    'yamlls',
  },
  automatic_installation = true,
}

--- Auto Formatting with Conform ---
require('conform').setup {
  formatters_by_ft = {
    lua = { 'stylua' },
    javascript = { 'biome', 'prettier', stop_after_first = true },
    typescript = { 'biome', 'prettier', stop_after_first = true },
    javascriptreact = { 'biome', 'prettier', stop_after_first = true },
    typescriptreact = { 'biome', 'prettier', stop_after_first = true },
    vue = { 'prettier' },
    svelte = { 'prettier' },
    python = { 'black', 'isort' },
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

local wk = require 'which-key'

--- LSP Configuration using new vim.lsp.config API ---

-- Function to set up LSP keymaps and capabilities
local function setup_lsp_keymaps(client, bufnr)
  local opts = { buffer = bufnr, silent = true }

  -- LSP navigation keymaps
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)

  -- Type definition and workspace symbols
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<leader>ws', vim.lsp.buf.workspace_symbol, opts)

  -- Diagnostics navigation
  vim.keymap.set('n', '[d', vim.diagnostic.get_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.get_next, opts)
  vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)

  -- Document highlighting
  if client.server_capabilities.documentHighlightProvider then
    local highlight_group = vim.api.nvim_create_augroup('LSPDocumentHighlight', { clear = false })
    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
      buffer = bufnr,
      group = highlight_group,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd('CursorMoved', {
      buffer = bufnr,
      group = highlight_group,
      callback = vim.lsp.buf.clear_references,
    })
  end
end

-- Get capabilities from blink.cmp
local capabilities = require('blink.cmp').get_lsp_capabilities()

-- Base LSP configuration
local base_config = {
  capabilities = capabilities,
  on_attach = setup_lsp_keymaps,
}

--- LSP Server Configurations ---

-- Lua Language Server
---@type vim.lsp.Config
local lua_ls_conf = vim.tbl_deep_extend('force', base_config, {
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
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    },
  },
})

-- Biome Language Server with code actions
local biome_conf = vim.tbl_deep_extend('force', base_config, {
  settings = {
    biome = {
      enabled = true,
    },
  },
  capabilities = vim.tbl_deep_extend('force', capabilities, {
    textDocument = {
      codeAction = {
        dynamicRegistration = true,
        codeActionLiteralSupport = {
          codeActionKind = {
            valueSet = {
              'quickfix',
              'refactor',
              'refactor.extract',
              'refactor.inline',
              'refactor.rewrite',
              'source',
              'source.organizeImports',
              'source.fixAll',
            },
          },
        },
      },
    },
  }),
})

-- HTML, CSS, JSON Language Servers (minimal config)
local html_conf = base_config
local cssls_conf = base_config
local jsonls_conf = base_config
local yamlls_conf = base_config

-- Register LSP configurations
vim.lsp.config('lua_ls', lua_ls_conf)
vim.lsp.config('html', html_conf)
vim.lsp.config('cssls', cssls_conf)
vim.lsp.config('biome', biome_conf)
vim.lsp.config('jsonls', jsonls_conf)
vim.lsp.config('yamlls', yamlls_conf)

-- Enable LSP servers
vim.lsp.enable {
  'lua_ls',
  'ts_ls',
  'vue_ls',
  'tailwindcss',
  'html',
  'cssls',
  'biome',
  'jsonls',
  'yamlls',
}

--- Diagnostic Configuration ---
vim.diagnostic.config {
  virtual_text = {
    spacing = 4,
    source = 'if_many',
    prefix = '●',
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.HINT] = '',
      [vim.diagnostic.severity.INFO] = '',
    },
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    focusable = true,
    style = 'minimal',
    border = 'rounded',
    source = 'if_many',
    header = '',
    prefix = '',
  },
}

require('lspkind').init {
  mode = 'symbol_text',
  preset = 'default',
  symbol_map = {},
}
