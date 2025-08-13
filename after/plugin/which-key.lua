require('which-key').setup {
  preset = 'modern',
  delay = 150,
  expand = 3,
  notify = false,
  replace = {
    key = {
      { '<Space>', 'SPC' },
      { '<cr>', 'RET' },
      { '<tab>', 'TAB' },
    },
  },
  spec = {
    { '<leader>b', group = 'buffer' },
    { '<leader>d', group = 'database' },
    { '<leader>g', group = 'git' },
    { '<leader>l', group = 'lsp' },
    { '<leader>t', group = 'toggle' },
  },
}

require('which-key').add {
  { '<leader>bx', desc = 'Delete buffer' },
  { '<leader>e', desc = 'Toggle file tree' },
  { '<leader>ff', desc = 'Find files' },
  { '<leader>fg', desc = 'Live grep' },
  { '<leader>fb', desc = 'Find buffers' },
  { '<leader>fh', desc = 'Help tags' },
  { '<leader>fm', desc = 'Man pages' },
  { '<leader>fc', desc = 'Colorschemes' },
  { '<leader>ft', desc = 'LSP symbols' },
  { '<leader>du', desc = 'Toggle DBUI' },
  { '<leader>df', desc = 'Find DB buffer' },
  { '<leader>dr', desc = 'Rename DB buffer' },
  { '<leader>dq', desc = 'Last query info' },
  { ',', desc = 'Toggle comma EOL' },
  { '<C-;>', desc = 'Toggle semicolon EOL' },
  { '-', desc = 'Open oil file explorer' },
}
