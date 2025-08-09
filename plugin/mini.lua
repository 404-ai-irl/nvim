local add = vim.pack.add

add { 'https://github.com/echasnovski/mini.nvim' }

  require('mini.animate').setup()
  require('mini.icons').setup()

  -- For QoL
  require('mini.snippets').setup()
  require('mini.pairs').setup() -- Autopairs
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

  -- Currently Testing
  require('mini.cursorword').setup { delay = 100 }
  -- require('mini.tabline').setup { show_icons = true },
  -- require('mini.statusline').setup { use_icons = true },
