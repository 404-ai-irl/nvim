return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  opts = {
    ensure_installed = {
      'bash',
      'c',
      'diff',
      'html',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'rust',
      'zig',
    },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = {
        'lua',
        'typescript',
        'typescriptreact',
      },
    },
    indent = {
      enable = true,
      disable = { 'ruby' },
    },
  },
}
