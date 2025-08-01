return {
  'mason-org/mason-lspconfig.nvim',
  dependencies = {
    { 'j-hui/fidget.nvim', opts = {} },
    {
      'mason-org/mason.nvim',
      opts = {
        lazy = false,
        pip = {
          upgrade_pip = true,
          install_args = { '--no-cache-dir' },
        },
      },
    },
    'neovim/nvim-lspconfig',
  },
  opts = {
    automatic_enable = {
      exclude = {
        'ts_ls',
      },
    },
  },
}
