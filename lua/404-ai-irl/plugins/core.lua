return {
  --- LSP
  ---@module "mason-lspconfig"
  {
    'mason-org/mason-lspconfig.nvim',
    opts = {
      ensure_installed = {
        'lua_ls',
        'ts_ls',
        'lua_ls',
        'biome',
        'eslint',
        'tailwindcss',
        'html',
        'cssls',
        'jsonls',
        'yamlls',
      },
      automatic_enable = true,
      automatic_installation = true,
      max_concurrent_installers = 6,
      check_outdated_packages_on_open = true,
    },
    dependencies = {
      {
        'mason-org/mason.nvim',
        ---@module 'mason'
        opts = {},
      },
      'neovim/nvim-lspconfig',
      'b0o/schemastore.nvim',
    },
  },
  --- TS
  ---@module "nvim-treesitter"
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-context',
      {
        'windwp/nvim-ts-autotag',
      },
    },
    opts = {
      ---@module 'nvim-treesitter.config'
      ensure_installed = {
        'lua',
        'javascript',
        'typescript',
        'markdown',
        'markdown_inline',
        'latex',
        'regex',
        'bash',
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
    ft = 'lua',
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
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
      'TmuxNavigatorProcessList',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
    },
  },
}
