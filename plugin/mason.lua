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

--- Vue setup - WIP
local vue_ls_path = vim.fn.expand '$MASON/packages' .. '/vue-language-server' .. '/node_modules/@vue/language-server'
local tsserver_filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }
local vue_plugin = {
  name = '@vue/typescript-plugin',
  location = vue_ls_path,
  languages = { 'vue' },
  configNamespace = 'typescript',
}
local vue_ls_config = vim.tbl_deep_extend('force', base_config, {
  on_init = function(client)
    client.handlers['tsserver/request'] = function(_, result, context)
      local ts_clients = vim.lsp.get_clients { bufnr = context.bufnr, name = 'ts_ls' }
      local clients = {}

      vim.list_extend(clients, ts_clients)

      if #clients == 0 then
        vim.notify('Could not find `ts_ls` lsp client, `vue_ls` would not work without it.', vim.log.levels.ERROR)
        return
      end
      local ts_client = clients[1]

      local param = unpack(result)
      local id, command, payload = unpack(param)
      ts_client:exec_cmd({
        title = 'vue_request_forward', -- You can give title anything as it's used to represent a command in the UI, `:h Client:exec_cmd`
        command = 'typescript.tsserverRequest',
        arguments = {
          command,
          payload,
        },
      }, { bufnr = context.bufnr }, function(_, r)
        local response = r and r.body
        -- TODO: handle error or response nil here, e.g. logging
        -- NOTE: Do NOT return if there's an error or no response, just return nil back to the vue_ls to prevent memory leak
        local response_data = { { id, response } }

        ---@diagnostic disable-next-line: param-type-mismatch
        client:notify('tsserver/response', response_data)
      end)
    end
  end,
})

--- TypeScript Language Server
local ts_ls_conf = vim.tbl_deep_extend('force', base_config, {
  init_options = {
    plugins = { vue_plugin },
  },
  filetypes = tsserver_filetypes,
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
vim.lsp.config('vue_ls', vue_ls_config)
vim.lsp.config('tailwindcss', tailwindcss_conf)
vim.lsp.config('html', html_conf)
vim.lsp.config('cssls', cssls_conf)

-- Enable LSP servers
vim.lsp.enable {
  'lua_ls',
  'vue_ls',
  'tailwindcss',
  'html',
  'cssls',
  'biome',
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
    source = 'if_many', -- | 'if-many'
    header = '',
    prefix = '',
  },
}
