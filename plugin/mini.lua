require('mini.move').setup {
  mappings = {
    left = '<C-S-h>',
    right = '<C-S-l>',
    down = '<C-S-j>',
    up = '<C-S-k>',
    line_left = '<C-S-h>',
    line_right = '<C-S-l>',
    line_down = '<C-S-j>',
    line_up = '<C-S-k>',
  },
}
require('mini.ai').setup()
require('mini.surround').setup()
require('mini.comment').setup()
