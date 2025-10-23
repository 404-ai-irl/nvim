return {
  --- LSP
  {
    'mason-org/mason-lspconfig.nvim',
    opts = {},
    dependencies = {
      {
        'mason-org/mason.nvim',
        opts = {
          ensure_installed = {
            'lua_ls',
            'ts_ls',
            'lua_ls',
            'biome',
            'tailwindcss',
            'html',
            'cssls',
            'jsonls',
            'yamlls',
          },
          automatic_installation = true,
          max_concurrent_installers = 6,
          check_outdated_packages_on_open = true,
        },
      },
      'neovim/nvim-lspconfig',
    },
  },
  --- TS
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-context',
      'windwp/nvim-ts-autotag',
    },
    opts = {
      sync_install = true,
      ensure_installed = {
        'lua',
        'javascript',
        'typescript',
        'markdown',
        'markdown_inline',
        'latex',
        'regex',
        'json',
        'yaml',
      },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
      },
      indent = {
        enable = true,
      },
      ignore_install = {},
      modules = {},
    },
  },
  --- Formatting
  {
    'stevearc/conform.nvim',
    dependencies = { 'NMAC427/guess-indent.nvim', event = { 'BufReadPre', 'BufNewFile' }, opts = {} },

    opts = {
      formatters_by_ft = {
        lua = { 'stylua' },
        javascript = { 'biome', 'prettier', stop_after_first = true },
        typescript = { 'biome', 'prettier', stop_after_first = true },
        javascriptreact = { 'biome', 'prettier', stop_after_first = true },
        typescriptreact = { 'biome', 'prettier', stop_after_first = true },
        html = { 'biome' },
        css = { 'biome' },
        json = { 'biome' },
        yaml = { 'biome' },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = 'fallback',
      },
    },
  },
  --- Nvim / Lua lsp setup
  {
    'folke/lazydev.nvim',
    ft = 'lua', -- only load on lua files
    opts = {
      library = {
        {
          path = '${3rd}/luv/library',
          words = {
            'vim%.uv',
          },
        },
      },
    },
  },

  --- TMUX integration
  {
    'alexghergh/nvim-tmux-navigation',
    opts = {
      disable_when_zoomed = false,
      keybindings = {
        left = '<C-h>',
        down = '<C-j>',
        up = '<C-k>',
        right = '<C-l>',
        last_active = '<C-\\>',
        next = '<C-Space>',
      },
    },
  },
}
