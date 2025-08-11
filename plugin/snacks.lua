vim.pack.add {
  { src = 'https://github.com/folke/snacks.nvim' },
}

require('snacks').setup {
  picker = {
    enabled = true,
    win = {
      input = {
        keys = {
          ['<c-j>'] = { 'move_down', mode = { 'i', 'n' } },
          ['<c-k>'] = { 'move_up', mode = { 'i', 'n' } },
        },
      },
    },
  },
  explorer = {
    enabled = false,
  },
  bigfile = { enabled = true },
  notifier = { enabled = true },
  quickfile = { enabled = true },
  statuscolumn = { enabled = false },
  words = { enabled = true },
}

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Main picker mappings (replacing telescope)
keymap('n', '<leader>ff', function() require('snacks').picker.files() end, opts)
keymap('n', '<leader>fg', function() require('snacks').picker.grep() end, opts)
keymap('n', '<leader>fb', function() require('snacks').picker.buffers() end, opts)
keymap('n', '<leader>fh', function() require('snacks').picker.help() end, opts)
keymap('n', '<leader>fm', function() require('snacks').picker.man() end, opts)
keymap('n', '<leader>fc', function() require('snacks').picker.colorschemes() end, opts)
keymap('n', '<leader>ft', function() require('snacks').picker.lsp_symbols() end, opts)

-- Snacks-specific mappings
keymap('n', '<leader>sf', function() require('snacks').picker.files() end, opts)
keymap('n', '<leader>sg', function() require('snacks').picker.grep() end, opts)
keymap('n', '<leader>sb', function() require('snacks').picker.buffers() end, opts)
keymap('n', '<leader>sr', function() require('snacks').picker.recent() end, opts)
keymap('n', '<leader>sh', function() require('snacks').picker.help() end, opts)