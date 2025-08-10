vim.pack.add { 'https://github.com/echasnovski/mini.nvim' }
require('mini.animate').setup()
require('mini.icons').setup()
require('mini.snippets').setup {}
require('mini.cursorword').setup { delay = 100 }
require('mini.pairs').setup() -- Autopairs
require('mini.comment').setup() -- `gc` to comment
require('mini.ai').setup { n_lines = 500 } -- around / inside (Text Objects)
require('mini.surround').setup() -- surround words, create surrounds eg: `swa`

local miniclue = require 'mini.clue'
miniclue.setup {
  window = {
    config = {},
    delay = 1000,
    scroll_down = '<C-d>',
    scroll_up = '<C-u>',
  },
  triggers = {
    -- Leader triggers
    { mode = 'n', keys = '<Leader>' },
    { mode = 'x', keys = '<Leader>' },

    -- Built-in completion
    { mode = 'i', keys = '<C-x>' },

    -- `g` key
    { mode = 'n', keys = 'g' },
    { mode = 'x', keys = 'g' },

    -- Marks
    { mode = 'n', keys = "'" },
    { mode = 'n', keys = '`' },
    { mode = 'x', keys = "'" },
    { mode = 'x', keys = '`' },

    -- Registers
    { mode = 'n', keys = '"' },
    { mode = 'x', keys = '"' },
    { mode = 'i', keys = '<C-r>' },
    { mode = 'c', keys = '<C-r>' },

    -- Window commands
    { mode = 'n', keys = '<C-w>' },

    -- `z` key
    { mode = 'n', keys = 'z' },
    { mode = 'x', keys = 'z' },
  },
  clues = {
    -- Enhance this by adding descriptions for <Leader> mapping groups
    miniclue.gen_clues.builtin_completion(),
    miniclue.gen_clues.g(),
    miniclue.gen_clues.marks(),
    miniclue.gen_clues.registers(),
    miniclue.gen_clues.windows(),
    miniclue.gen_clues.z(),
  },
}

require('mini.move').setup { -- Super + Movement to move lines
  mappings = {
    left = '<D-h>',
    right = '<D-l>',
    down = '<D-j>',
    up = '<D-k>',
    line_left = '<D-h>',
    line_right = '<D-l>',
    line_down = '<D-j>',
    line_up = '<D-k>',
  },
}

-- Currently Testing
-- require('mini.tabline').setup { show_icons = true },
-- require('mini.statusline').setup { use_icons = true },
