vim.pack.add { 'https://github.com/echasnovski/mini.nvim' }

require('mini.icons').setup()
require('mini.snippets').setup {}
require('mini.comment').setup() -- `gc` to comment
require('mini.ai').setup { n_lines = 500 } -- around / inside (Text Objects)
require('mini.surround').setup() -- surround words, create surrounds eg: `swa`

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
