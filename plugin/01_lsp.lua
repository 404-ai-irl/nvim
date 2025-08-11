-- Mason setup with blink.cmp integration and conform formatting
-- Uses Neovim 0.12+  for vim.lsp.config() API and vim.pack API

vim.pack.add {
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/williamboman/mason.nvim' },
  { src = 'https://github.com/williamboman/mason-lspconfig.nvim' },
  { src = 'https://github.com/stevearc/conform.nvim' },
}

--- Mason LSP Setup
require('mason').setup {
  ui = {
    icons = {
      package_installed = '✓',
      package_pending = '➜',
      package_uninstalled = '✗',
    },
  },
}

require('mason-lspconfig').setup {
  -- Automatically install these language servers
  ensure_installed = {
    'lua_ls',
    'rust_analyzer',
    'pyright',
    'ts_ls',
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
    rust = { 'rustfmt', lsp_format = 'fallback' },
    javascript = { 'biome', 'prettier', stop_after_first = true },
    typescript = { 'biome', 'prettier', stop_after_first = true },
    javascriptreact = { 'biome', 'prettier', stop_after_first = true },
    typescriptreact = { 'biome', 'prettier', stop_after_first = true },
    vue = { 'prettier' },
    svelte = { 'prettier' },
    python = { 'black', 'isort' },
    html = { 'prettier' },
    css = { 'prettier' },
    json = { 'biome' },
    yaml = { 'biome' },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = 'fallback',
  },
}

-- Manual formatting keymap (since conform handles auto-formatting)
vim.keymap.set({ 'n', 'v' }, '<leader>f', function()
  require('conform').format {
    lsp_format = 'fallback',
    async = false,
    timeout_ms = 500,
  }
end, { desc = 'Format file or range (in visual mode)' })

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

-- TypeScript Language Server
---@type vim.lsp.Config
local ts_ls_conf = vim.tbl_deep_extend('force', base_config, {
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = 'all',
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = 'all',
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
  },
})

-- Python Language Server
---@type vim.lsp.Config
local pyright_conf = vim.tbl_deep_extend('force', base_config, {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = 'basic',
        autoImportCompletions = true,
      },
    },
  },
})

-- Rust Analyzer
---@type vim.lsp.Config
local rust_analyzer_conf = vim.tbl_deep_extend('force', base_config, {
  settings = {
    ['rust-analyzer'] = {
      cargo = {
        allFeatures = true,
      },
      checkOnSave = {
        command = 'clippy',
      },
    },
  },
})

-- Tailwind CSS Language Server
---@type vim.lsp.Config
local tailwindcss_conf = vim.tbl_deep_extend('force', base_config, {
  settings = {
    tailwindCSS = {
      classAttributes = { 'class', 'className', 'classList', 'ngClass' },
      lint = {
        cssConflict = 'warning',
        invalidApply = 'error',
        invalidConfigPath = 'error',
        invalidScreen = 'error',
        invalidTailwindDirective = 'error',
        invalidVariant = 'error',
        recommendedVariantOrder = 'warning',
      },
      validate = true,
    },
  },
})

-- HTML, CSS, JSON Language Servers (minimal config)
local html_conf = base_config
local cssls_conf = base_config

-- Register LSP configurations
vim.lsp.config('lua_ls', lua_ls_conf)
vim.lsp.config('ts_ls', ts_ls_conf)
vim.lsp.config('pyright', pyright_conf)
vim.lsp.config('rust_analyzer', rust_analyzer_conf)
vim.lsp.config('tailwindcss', tailwindcss_conf)
vim.lsp.config('html', html_conf)
vim.lsp.config('cssls', cssls_conf)

-- Enable LSP servers
vim.lsp.enable {
  'lua_ls',
  'ts_ls',
  'pyright',
  'rust_analyzer',
  'tailwindcss',
  'html',
  'cssls',
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
      [vim.diagnostic.severity.ERROR] = '󰅚', -- nf-md-close_circle (or use  nf-fa-times_circle)
      [vim.diagnostic.severity.WARN] = '󰀪', -- nf-md-alert (or use  nf-fa-exclamation_triangle)
      [vim.diagnostic.severity.HINT] = '󰌶', -- nf-md-lightbulb (or use  nf-fa-lightbulb_o)
      [vim.diagnostic.severity.INFO] = '󰋽', -- nf-md-information (or use  nf-fa-info_circle)
    },
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    focusable = false,
    style = 'minimal',
    border = 'rounded',
    source = true, -- | 'if-many'
    header = '',
    prefix = '',
  },
}
