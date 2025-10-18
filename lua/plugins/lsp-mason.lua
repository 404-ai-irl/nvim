return {
  -- Core LSP configuration
  'neovim/nvim-lspconfig',

  -- Mason package manager
  {
    'williamboman/mason.nvim',
    event = 'VeryLazy',
    cmd = { 'Mason', 'MasonInstall', 'MasonUninstall' },
    opts = {
      PATH = 'prepend',
      max_concurrent_installers = 6,
      check_outdated_packages_on_open = true,
      ui = {
        backdrop = 36,
        border = nil,
        height = 0.8,
        width = 0.7,
        icons = {
          package_installed = '',
          package_pending = ' ',
          package_uninstalled = '',
        },
      },
    },
  },

  -- Mason LSP configuration
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
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
    },
    config = function(_, opts)
      require('mason-lspconfig').setup(opts)

      -- LSP Server Configurations
      vim.lsp.config.lua_ls = {
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT',
            },
            diagnostics = {
              globals = { 'vim' },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file('', true),
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,
            },
          },
        },
      }

      -- LSP Diagnostics Configuration
      vim.diagnostic.config {
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = '€Z',
            [vim.diagnostic.severity.WARN] = '€*',
            [vim.diagnostic.severity.INFO] = '€ý',
            [vim.diagnostic.severity.HINT] = '€6',
          },
        },
        virtual_text = {
          prefix = 'Ï',
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
    end,
  },
}